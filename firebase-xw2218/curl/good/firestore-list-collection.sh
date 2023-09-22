#! /bin/sh

#. ./firebase-xw2218.env

rm -f list-collection.txt

#idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjJkMjNmMzc0MDI1ZWQzNTNmOTg0YjUxMWE3Y2NlNDlhMzFkMzFiZDIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2MzY0Mjg5OSwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjYzNjQyODk5LCJleHAiOjE2NjM2NDY0OTksImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.EDDh7oXgJUU5YC0OxtdYQ1VGBi6KMLXhFwOl__JvhA39396ISKwsVZaDeOCiDdhhbwrF9PYoOkjZRef9mxypL2PjWRuWbalrrjeyzPW4SUcT9sb1hIAs21jcs-rqmNWA-0QRS1tGcJDObUZsQAPUv8M3YOsCwpR9MdPV2N7EPkNGTF4bv_L6xBXiveNPlAW_g1mGeIRgRiz_RCj9bDPoY_ueN1bN9-A_YbM_SH7x9qH_yc5EnqzkwDulST5QbkO7FBjMpvn8rXBUSPbcBJAKKdX_wBozj8MDAMFQ-fUJwTNZ7-2WHukoJpQOj0SnSXR6JdFzxdAN1FMdOWe7St6FKw"
idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2NDA3MDIyNCwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjY0MDcwMjI0LCJleHAiOjE2NjQwNzM4MjQsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.oRIKf2B-HZak5juEPC9nCr1u10axw2_4Db03vfREU9gd7LWMhQNeMaX6LZz9h3ZAGdvg6nvYqOEAA4nh6huOhhYNvE_-EH_B4nyZ8Pd-4ciJ4ZDkvCcjYe5EknY4ImFsDvBrueFrKOfwjzAhbYqbOWjoU2XuMSSACg7sU7okgPhg5ScN-pWE3Uq2vq5SFLdvoQlezZw5FLIRXE0Lpwn6eIvO8_yH4_iWGq9gsGIQspSUvbwrQeC_ek_r4K6dkJGYJAMRtReCZOKEmpKnP-BoTDs73DZtCrEW83gCK1k9byTd5C3B1KvMnxbyiquM5LhHE1QEF42Y0I49-vYG7LCqfA"


curl  -X GET \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${idToken}" \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/databases/(default)/documents/xw2218/v1?&key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0" \
-o list-collection.txt

cat list-collection.txt
