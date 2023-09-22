# --- Python Config to access XW2218

# --- Environment Settings
path_to_certification = "/home/nick/work/python/firebase-xw2218/service-account-file.json"
COLLECTION_PHOTO = "xw2218-h1-v1-photo"
COLLECTION_NODE =  "xw2218-h1-v1-node"    
COLLECTION_AUDIO=  "xw2218-h1-v1-audio"    

# --- Code Start
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

from datetime import datetime
#import base64
#import sys

def printEnvironment():
    print("Environment is", path_to_certification)

# --- Login to XW2218 firestore 
def login():
    # Initialize Certification    
    try:
        cert = credentials.Certificate( path_to_certification)
    except:        
        print("Initialize Certification")
        return None
    # Initialize firebase admin
    try:
        firebase_admin.initialize_app(cert)
    except:        
        print("Initialize firebase admin")
        return None
    # Initialize firestore
    try:
        client = firestore.client()
    except:        
        print("Initialize firebase admin")
        return None
    return client

# --- Parse XW2218 ID to mac,datetime
def parse_id(id):
    # id = mac-data-time
    # split id string to words 

    try:
        tokens = id.split('-')
        m = tokens[0]
        d = tokens[1] + tokens[2]
 
#        print("mac", m)        
#        print("date", d)        

        t = datetime.strptime(d,'%Y%m%d%H%M%S')
#        t = datetime.strptime(d,'%Y%m%d')

#        print("datetime", t)
    except:
        print("Parse id failed")
        return None
 
#    print("MAC:", m)
#    print("DATETIME:", t)

    return m, t    

# --- Count Collection
def count_collection(collection):

    count = 0

    for item in collection:
        count = count +1

    return count


# --- Filter Collection by field
def filter(collection, field, compare, value):

    filtered_collection = []   

    for item in collection:
        mac, date = parse_id(item.id)
#        print('ID {id}, MAC {mac}, DATE {date}'.format(id=item.id, mac=mac, date=date))

        if ( field == 'mac' ):
            if compare_mac( mac, compare, value):
                filtered_collection.append( item )
#            else:
#                print('Ignore MAC {mac} {compare} {value}'.format(mac=mac, compare=compare, value=value))

        if ( field == 'date' ):
            if compare_date( date, compare, value):
                filtered_collection.append( item )
#            else:
#                print('Ignore Date {date} {compare} {value}'.format(date=date, compare=compare, value=value))

        if ( field == 'all' ):
            filtered_collection.append( item )

        if ( field == 'none' ):
            filtered_collection.append( item )


    return filtered_collection

# --- Compare MAC
def compare_mac(mac, compare, value):
    if ( value == 'none'):
        return True

    if (compare != '='): 
        return True

    if ( mac == value):
        return True
    else:
        return False

# --- Compare Date
def compare_date(date, compare, value):
    if ( value == 'none'):
        return True

    date_value = datetime.strptime(value, '%Y%m%d')

    if (compare == '>'):    
        return date.date() > date_value.date()
    if (compare == '='):    
        return date.date() == date_value.date()
    if (compare == '<'):    
        return date.date() < date_value.date()

    return True
