#! /bin/sh

#. ./firebase-xw2218.env


idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2MzY1NDgyOCwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjYzNjU0ODI4LCJleHAiOjE2NjM2NTg0MjgsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.KQfy5NVW47KhfQ234KPaXkJ0zASDfDDSmnDF8Hfq8WoGE07rnnk8WrD5KKgAX9dL9-321s7ZgYtuCs0CT4MuF1Jwf6-YF3wqN4vDqv-cBbo_hOYrji9v_8ts-npcepj-81cabiTjwQp1tAgL2Xi2O1X4N0X1wB9iZhLbWFJ3ZMBV9DlL85BYk_ZT17p19SwPcmfZK8mWVPXlM9EB8qk1nD6NTvwuNsANTUvxzAQ5879gKwVLp66ImvVdrmIsfGomf2uzSSYhqMueVLSdV9x7QQygV2J55bjE2yiZhmP2QAEIQrf2oz7W3r6xb38Evcx7TN7UI_IYjL2gRHJkNW-15g"
apiKey= "AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0"
collectionid= "Students"

curl  \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218?&key=${apiKey}"

url -X POST \
-H "Content-Type: application/json" \
-d'{
"fields": {
"Field1": {
"stringValue": "'"$var1"'"
},
"Field2": {
"stringValue": "'"$var2"'"
},
"Field3": {
"stringValue": "$var3"
}
}
}'\"https://firestore.googleapis.com/v1beta1/projects/**PROJECT_ID**/databases/(default)/documents/${collectionid}?&key=(YOUR API KEY)"
