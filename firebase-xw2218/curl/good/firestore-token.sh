#! /bin/sh



rm -f token.txt 


curl -X POST 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0' \
-H 'Content-Type: application/json' \
--data-binary '{"email":"redcolororc@gmail.com","password":"nx07295408","returnSecureToken":true}' \
-o token.txt

cat token.txt
