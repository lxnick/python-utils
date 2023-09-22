#! /bin/sh

. ./firebase-xw2218.env

#echo $SERVER_KEY
#echo $DEVICE_TOKEN

curl -X GET https://firestore.googleapis.com/v1/{parent=xw2218-dash/xw2218/databases/v1/documents/*/**}/{collectionId}

#curl "https://xw2218-dash.firebaseio.com/xw2218/.json"

#curl "https://xw2218-dash.firebaseio.com/.json?print=pretty&auth=AIzaSyAs_Z9zL3kTlB6bWhDrF76i2aQFeMKEItg"

#curl "https://<YOUR-FIREBASE-APP>.firebaseio.com/.json?print=pretty&auth=<YOUR-FIREBASE-APP-SECRET>  > [json-file-name].json"

#curl 'https://proj-name.firebaseio.com/repository/users.json?print=pretty' > data.json

