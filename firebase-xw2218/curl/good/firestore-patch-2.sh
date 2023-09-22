#! /bin/sh

#. ./firebase-xw2218.env

idToekn="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDE1NjIyOCwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjY0MTU2MjI4LCJleHAiOjE2NjQxNTk4MjgsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.OfNpoj96qtoKS96MVhnCVPaQAU8VTRrpxeSLzhGtGR-aQyKRH2aXz064SZKGGswC92j1xo1__7sha1Y6i7yBE1ed4l_xxmBRao8l3HPxhob7sYLgFc5b9knUAcqsqIWavF3hlGJGb4zv4sMBl8udsO-6aea2XqNew7jf7ENwuqpbpgAqfOcv5wquhzVXwUNyerKwruJZEm7ZL_VN6b_KsaiKLJ70TbtqRfl-m_G5YBEypRRYolk7T3gx1cxFYepzZIaPZUnIYl3oX6QOiIvszRcSZngMmOKaZ1oefGv2BUghUzDk3T4vvM0UHcVM_qvD9zbDXHwp6tLcug6zE6hwuQ"

curl  -X PATCH \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
  -d "{
    \"fields\": {
      \"username\": {
        \"mapValue\": {
          \"fields\": {
            \"endpoint\": {
              \"stringValue\": \"10.10.2.24\"
            }
          }
        }
      }
    }
  }" \
 "https://firestore.googleapis.com/v1beta1/projects/xw2218-dash/databases/(default)/documents/xw2218/v2?updateMask.fieldPaths=username.endpoint&currentDocument.exists=true&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o patch-v2.txt



cat patch-v2.txt