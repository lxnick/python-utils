#! /bin/sh

#. ./firebase-xw2218.env


idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDE3Njc0MiwidXNlcl9pZCI6IlJRN0hoRkxXMjJSVWlBbDM2NXNPcDlNS1Y3djEiLCJzdWIiOiJSUTdIaEZMVzIyUlVpQWwzNjVzT3A5TUtWN3YxIiwiaWF0IjoxNjY0MTc2NzQyLCJleHAiOjE2NjQxODAzNDIsImVtYWlsIjoicmVkY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlZGNvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.aoImkMKi4xru3zroKnwnaRidNoydaig7UZAQqL8sv-xd-NDJdIeiRke6SdSS5PpKeSkQTCel8xeXV6Ma5foQUkfJKNGE-92RQXn7ZLISGr2G0fcr0lxVspMbebfibsBx8v5044QBD1eya4RMYynKoS99H9HpkPshLcUJqhUg7xc-YHgV0XahNEB3WLYcdwVXnj2jAiq3gH159L2pGyyOGEYhDLwgBLVkxnsW4Vcc1BiKLOAivS8Ak8pKdxWkGBwXnJWRg1iD21F_QCS1xCHUs1prXVEfH2B1gvxqFbPU1mBGTmdW288ncTNaJDnfuTdKXKjqfUSz8RL05d1hNLnEUw"

curl  -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
--data-binary  '{ "fields": { "username": { "stringValue": "curl" }}}' \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218?documentId=v8&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o create-v8.txt

cat create-v8.txt
