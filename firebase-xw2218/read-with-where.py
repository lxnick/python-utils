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
path_to_collection  = "Students"
collection_ref = client.collection(path_to_collection)

# get collection with where
try:
    print("Get Collection with where name == orc");

    collection = collection_ref.where('name', '==', 'orc').get()
    for doc in collection:
        print("document: {}".format(doc.to_dict()))
except:
    print("collection get failed");


