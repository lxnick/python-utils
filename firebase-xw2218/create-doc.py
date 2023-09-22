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

# create a data-set
doc = {
    'name': 'orc',
    'desc': 'hungry'
}

# create a doc reference set-name, doc-id
docref = client.collection('Students').document('student01')
docref.set(doc)
