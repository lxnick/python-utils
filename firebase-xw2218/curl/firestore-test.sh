#! /bin/sh

#. ./firebase-xw2218.env

#idToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjJkMjNmMzc0MDI1ZWQzNTNmOTg0YjUxMWE3Y2NlNDlhMzFkMzFiZDIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2MzY0Mjg5OSwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjYzNjQyODk5LCJleHAiOjE2NjM2NDY0OTksImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.EDDh7oXgJUU5YC0OxtdYQ1VGBi6KMLXhFwOl__JvhA39396ISKwsVZaDeOCiDdhhbwrF9PYoOkjZRef9mxypL2PjWRuWbalrrjeyzPW4SUcT9sb1hIAs21jcs-rqmNWA-0QRS1tGcJDObUZsQAPUv8M3YOsCwpR9MdPV2N7EPkNGTF4bv_L6xBXiveNPlAW_g1mGeIRgRiz_RCj9bDPoY_ueN1bN9-A_YbM_SH7x9qH_yc5EnqzkwDulST5QbkO7FBjMpvn8rXBUSPbcBJAKKdX_wBozj8MDAMFQ-fUJwTNZ7-2WHukoJpQOj0SnSXR6JdFzxdAN1FMdOWe7St6FKw"
ID_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20veHcyMjE4LWRhc2giLCJhdWQiOiJ4dzIyMTgtZGFzaCIsImF1dGhfdGltZSI6MTY2MzY1NDgyOCwidXNlcl9pZCI6IkNKYmtwZ21xazBiVGVSUXdiREZ6UVdsbmg5cTIiLCJzdWIiOiJDSmJrcGdtcWswYlRlUlF3YkRGelFXbG5oOXEyIiwiaWF0IjoxNjYzNjU0ODI4LCJleHAiOjE2NjM2NTg0MjgsImVtYWlsIjoicmVjY29sb3JvcmNAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInJlY2NvbG9yb3JjQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.KQfy5NVW47KhfQ234KPaXkJ0zASDfDDSmnDF8Hfq8WoGE07rnnk8WrD5KKgAX9dL9-321s7ZgYtuCs0CT4MuF1Jwf6-YF3wqN4vDqv-cBbo_hOYrji9v_8ts-npcepj-81cabiTjwQp1tAgL2Xi2O1X4N0X1wB9iZhLbWFJ3ZMBV9DlL85BYk_ZT17p19SwPcmfZK8mWVPXlM9EB8qk1nD6NTvwuNsANTUvxzAQ5879gKwVLp66ImvVdrmIsfGomf2uzSSYhqMueVLSdV9x7QQygV2J55bjE2yiZhmP2QAEIQrf2oz7W3r6xb38Evcx7TN7UI_IYjL2gRHJkNW-15g"


curl  \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ID_TOKEN}" \
"https://firestore.googleapis.com/v1/projects/xw2218-dash/xw2218/documents/v1.json?&key=$API_KEY"

