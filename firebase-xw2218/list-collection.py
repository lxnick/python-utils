# list-collection <collection-path>

from xw2218 import *

# --- Call XW2218.login()
client = login()

# path to collection
path_to_collection  = "xw2218-h1-v1-audio"
#path_to_collection  = "Students"

collections = client.collection(path_to_collection).get()
print ("Collection:")
for collection in collections:
    print (collection.id)

