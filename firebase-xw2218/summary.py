# --- Python Code to test XW2218

# --- Import XW2218
from ConfigXW2218 import *

XW2218_PHOTO = "xw2218-h1-v1-photo"
XW2218_NODE  = "xw2218-h1-v1-node"
XW2218_AUDIO = "xw2218-h1-v1-audio"

def show_summary( collection ):
    mac_dict = dict()
    date_dict = dict()

    for item in collection:
        result = parse( item.id)

        if result == None :
            continue;

        mac = result[0]
        date = result[1].date()

        if mac in mac_dict:
            mac_dict[ mac ] +=1
        else:
            mac_dict[ mac ] =1

        if date in date_dict:
            date_dict[ date ] +=1
        else:
            date_dict[ date ] =1

    print('nodes by mac:')
    for i, (m, c) in enumerate( mac_dict.items()):
#        print(i, m, c)
        print('[{index}] MAC[{mac}] count {count}'.format(index=i, mac = m, count=c))       

    print('nodes by date:')

    for i, (d, c) in enumerate( date_dict.items()):
#        print(i, d, c)
        print('[{index}] date[{date}] count {count}'.format(index=i, date = d, count=c))       

        
#    print(mac_dict)
#    print(date_dict)


# --- Call XW2218
client = login()

node = client.collection( XW2218_NODE ).get()
print(">>>Node Summary Node")
show_summary( node )

