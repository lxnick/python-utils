# example program for Firebase

# --- Environemnt Settings
path_to_certification = "/home/nick/work/python/firebase-xw2218/service-account-file.json"

# --- Code Start
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

import base64
import sys

record_id = "94a4087f16c0-20221201-150740"
# Check Parameter
if (len( sys.argv) > 1):
    record_id = sys.argv[1]

# initialize certification
cert = credentials.Certificate( path_to_certification)

# init firebase admin
firebase_admin.initialize_app(cert)

# init firestore
client = firestore.client()

# path to document
#path_to_document  = "xw2218-h1-v1-audio/94a4087f16c0-20221201-150740"
path_to_document  = "xw2218-h1-v1-audio/" + record_id

# document content
try:
    document_ref = client.document(path_to_document)

    document = document_ref.get()
#    print("{}".format(document.to_dict()))
    print("Print Document" )

    audio_field = document.get('audio')
    print("Get Field")

#    print( audio_field )
    print("Print Field")

    with open(record_id + '.wav', 'wb') as file_to_save:
        print('Open for write');
        decoded_audio_data = base64.b64decode(audio_field)
        print('Decode success:');
#        print(decoded_audio_data);
        file_to_save.write( decoded_audio_data )    

    print("Success");

except:
    print("Failed");

print("Complete");

#document_ref.update(doc);
