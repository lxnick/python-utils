# example program for Firebase

# --- Environemnt Settings
path_to_certification = "/home/nick/work/firebase//firebase-xw2218/service-account-file.json"

# --- Code Start
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# initialize certification
cert = credentials.Certificate( path_to_certification)

# init firebase admin
firebase_admin.initialize_app(cert)

# init firestore
client = firestore.client()

# path to collection
path_to_collection  = "xw2218/v1/photo"
#path_to_collection  = "Students"

# path to document
path_to_document  = "xw2218/v1/photo/112233445566-20220919-12345"

collections = client.collection(path_to_collection).get()
print ("Collection:")
for collection in collections:
    print (collection.id)


document = client.document(path_to_document).get()
print ("Document:")
print ("{}".format(document.to_dict()))    
