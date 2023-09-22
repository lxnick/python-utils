#! /bin/sh

export GOOGLE_APPLICATION_CREDENTIALS="/home/nick/work/firebase/firebase-wx2218/service-account-file.json"

curl -i -H 'Content-type: application/json' -H 'Authorization: key=<your_server_key>' -XPOST https://fcm.googleapis.com/fcm/send -d '{
  "registration_ids":["registration_ids", "of the", "target", "devices as array"],
  "notification": {
      "title":"Title of your notification",
      "body":"content of your notification"
  },
  "data": {
    "key1" : "value1",
    "key2" : "value2",
    "key3" : 23.56565,
    "key4" : true
  }
}'
