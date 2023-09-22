#! /bin/sh

#. ./firebase-xw2218.env

rm -f create-document.txt
idToekn="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDA5MjU1OCwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjY0MDkyNTU4LCJleHAiOjE2NjQwOTYxNTgsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.Kh_imFprydzw9OX27FYZI5gpDq-6qzJLRLkmnlZm7SWx9jtzbOgj5NeUYRKExu-9Zqfwt13bfsb12T5V99ayy1T22ZYMxscrEpSlUch6AgsaUAsWQQb-mFPY5XjzJMV8UWr-ps6moCctnhs6YFSJ79UPt-91AHPVto0kxCtBTmbUYmfOSaHp0K2p7OaovY2VzOo6Dk3kd8bYPb1n-frOVylVMChBsFY8K9d9QRL1Oya2vtQvYfL1MhPwUiWkNsQr1uuqa1zAu3GOSDbVQsTxRerBM5LF2-VnsDC1kbqTEOMrrP3_Ice2-Ru9F6ihF1dLk7DUR-8cU0Bq2FQ5uZaWFg"

curl  -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218?documentId=v3&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o create-v3.txt

-d '{ "name":"","fields": { "username": { "stringValue": "John Doe" } } }' \



cat create-v3.txt
