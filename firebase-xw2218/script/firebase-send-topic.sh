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
}' https://fcm.googleapis.com/fcm/send 


