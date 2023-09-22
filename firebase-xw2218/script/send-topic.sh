#! /bin/sh

. ./firebase-xw2218.env

#echo $SERVER_KEY
#echo $DEVICE_TOKEN

curl -X POST -verbose -H "Authorization:key=$SERVER_KEY"  -H "Content-Type: application/json"  -d '{"to": "/topics/weather", "data": {"message": "A message"}}' https://fcm.googleapis.com/fcm/send 



