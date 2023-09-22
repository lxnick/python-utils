#! /bin/sh

#. ./firebase-xw2218.env

idToekn="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDExMzU0NywidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjY0MTEzNTQ3LCJleHAiOjE2NjQxMTcxNDcsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.CDmTYm4ZbLeS4InNG5tyoOveoFkybBToYwepulbceFMnUAB4EkxWU1HP1vYRtOGjlqfypfRop1xVKTcwcjswiVlv4z36kLUdjUFBbuEvt_kVv_QYWdNUirYVXYoYRlRngihaHRk-xhrPFqEJ1nZJmROz-uEYTLk5-frKJwq7IetpB7dEF9U01hYjGUGc5oQn_U5pq_otjO9x3saHfmcqqIWez9Qhw1pmcNjinrhjbTdQLNcnd74u0f8_9uI6ZWR5FzDre2i8wkx78SX38tmf1Y537LwcbmpprZnHV-8z86Um2qtCnfh38kpLnKYj0zuxdM6oikXVuKTawhaU4-ZfkA"

curl  -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
--data '{ database:"projects/xw2218/databases/(default)"name":"","fields": { "username": { "stringValue": "Hello World" } } }' \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents:commit?key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o patch-v2.txt




cat patch-v2.txt
