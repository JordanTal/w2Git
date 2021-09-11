#!/bin/bash

PASS=$1
VALID=TRUE
if [ ! "${#PASS}" -ge 10 ]	
  then
    echo “ password too short , password needs to contain at least 10 characters”
    VALID=TRUE
    exit 1
fi
if [ !"$PASS" == *[0-9]* ]
  then
    VALID=FALSE  
    echo “invalid password, password should contain at least 1 digit”
fi
    exit 1
if [ !"$PASS" == *[A-Z]* && "$PASS" == *[a-z]* ]
  then
   VALID=FALSE
   echo “Invalid password , \n password should include both the small and capital case letters.
fi
if [$VALID == TRUE]
  then
   echo "password passed the validation"
   exit 0
fi
