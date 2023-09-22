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
path_to_document  = "xw2218/v1/photo/112233445566-20220919-12345"

document_ref = client.document(path_to_document)

# document content
doc= {
    'desc': 'good to eat'
}

document_ref.update(doc);
