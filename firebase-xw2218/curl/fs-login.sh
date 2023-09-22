#! /bin/sh

#. ./firebase-xw2218.env

curl 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAK0__HouR0MWQj2EYNOkrlkQuc1LDNXW0' \
-H 'Content-Type: application/json' \
--data-binary '{"email":"reccolororc@gmail.com","password":"nx07295408","returnSecureToken":true}' \
-o log.txt
