#! /bin/sh

#. ./firebase-xw2218.env

idToekn="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDE3MjUwMywidXNlcl9pZCI6IlJRN0hoRkxXMjJSVWlBbDM2NXNPcDlNS1Y3djEiLCJzdWIiOiJSUTdIaEZMVzIyUlVpQWwzNjVzT3A5TUtWN3YxIiwiaWF0IjoxNjY0MTcyNTAzLCJleHAiOjE2NjQxNzYxMDMsImVtYWlsIjoicmVkY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlZGNvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.DoU7ZwgEfBIh8b3rGFU7OUuz-CPXTeF55IspxHZY02FYOzrYEINWYkhx3PqE1aMM_6Ppj6l1N3U4D8DUbYhLipNKEb3r6UnhgaFfmnUlRuBQdw1pKj5gexOGknh7IW-rIrJWfvJK-ECKMWLAsp6eoUM4EqZgI3Bi7JmhLZnof62S5RLo328kKn2PbhxRUZz4PhWzM2UoN9cjjLad9sG5oy72hO5XvbOFwrE8U0_HHAEZTmxRCExQLHngcVxoummCCMRGIqQLogj2d859XE6ZAMlBznrLEsVLo6tlEIgFx27P3QeA3EcLsube2Td00GB2EVft8Um6N-4Uwy3O5axRMw"

curl  -X PATCH \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
-H "Content-Length:72" \
--data '{ "name":"v5","fields": { "username": { "stringValue": "Hello World" }}}' \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218/v5?updateMask.fieldPaths=username&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o patch-v5.txt




cat patch-v5.txt
