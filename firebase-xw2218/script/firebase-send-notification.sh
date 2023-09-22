#! /bin/sh

. ./firebase-xw2218.env

echo $SERVER_KEY
echo $DEVICE_TOKEN

curl -X POST \
    -H "Authorization:key=$SERVER_KEY"   \
    -H "Content-Type: application/json"         \
    -d '{ "message": { 
            "notification": {        
                "title": "FCM Message",              
                "body": "This is an FCM Message"}
        }
}' https://fcm.googleapis.com/fcm/send 


