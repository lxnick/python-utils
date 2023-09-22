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

# path to document
path_to_document  = "Students/student01"

document_ref = client.document(path_to_document)

# path to collection
path_to_collection  = "Students"
collection_ref = client.collection(path_to_collection)

# get document
try:
    document = document_ref.get()
#    print(document.id)
    print("Get Document");
    print("{}".format(document.to_dict()))
except:
    print("docuemnt get failed");


# get collection
try:
    collection = collection_ref.get()
    print("Get Collection");
    for doc in collection:
        print("document: {}".format(doc.to_dict()))
except:
    print("collection get failed");


# get collection with where
try:
    print("Get Collection with wehre, name == orc");
    collection = collection_ref.where('name', '=', 'orc')
    for doc in collection:
        print("document: {}".format(doc.to_dict()))
except:
    print("collection get failed");
