#! /bin/sh

. ./firebase-xw2218.env

#echo $SERVER_KEY
#echo $DEVICE_TOKEN

curl -X POST -verbose \
    -H "Authorization:key=$SERVER_KEY"   \
    -H "Content-Type: application/json"         \
    -d '{ "message": { 
            "data ": {        
                "title":"FCM Message",              
                "body":"This is an FCM Message"
            },
            "to":"\weather"
        }
}' https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/


curl  -X POST https://firestore.googleapis.com/v1/projects/transfer-status-realtime/databases/(default)/documents/transfers  \
    -H "Content-Type: application/json" \
    -H "Authorization:key=$SERVER_KEY"   \
    -d "{\"fields\": { \"status\": { \"stringValue\": \"outro status\" } }}"
    {
        "name": "projects/transfer-status-realtime/databases/(default)/documents/transfers/ddwHxjy7eQV3640pW0Xx",
        "fields": {
        "status": {
        "stringValue": "outro status"
        }
    },
  "createTime": "2020-04-06T16:21:16.453553Z",
  "updateTime": "2020-04-06T16:21:16.453553Z"
} 


