#! /bin/sh

#. ./firebase-xw2218.env


idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2MzkxNDc0MSwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjYzOTE0NzQxLCJleHAiOjE2NjM5MTgzNDEsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.PrTzZk7fnrCe20cBeqmqKu1dXcR9Ia5adbdPIhGBC2qj6QT2LWVAT3QFfW4wZFyfl5QPi_uVz_SWH1dIHjNY97kyvmdbUsqRqY0G6QiZJu6RflkEdNRYESb6M_-aTDTLC8sGljsKOxafhR2kZ2aTfyxOye0SnH7Ng_7rYagYPNE1fJ93rSAb6CQ4hyD3CX_ovqYwkO73C6ff3BPiidlq25pPh1wicGZPSUe6ccuu05TvsHRML4nfOL5JrrmtJ2uW1aajwkVPHjCDGawZdCsE__TRrKMNGiF6ITvxwQAXK4iwiLUp__NTHvCWrUUJnsDJW3W_N2986K99In-uaXnKsw"

curl  -X GET \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218/v1?&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0"

curl -X POST \
-H "Content-Type: application/json" \
-d' {
    "fields": {
        "Field1": {
            "arrayValue": {
                "values": [{
                    "mapValue": {
                        "fields": {
                            "key1": {
                                "stringValue": "val1"
                            },
                            "key2": {
                                "stringValue": "val2"
                            }
                        }

                    }
                }]
            }
        },
        "Field2": {
            "integerValue": <intValue>
        },
        "Field3": {
            "stringValue": "var3"
        }
    }
}'\"https://firestore.googleapis.com/v1beta1/projects/**PROJECT_ID**/databases/(default)/documents/**COLLECTION_ID**?&key=<YOUR WEB API KEY>"
