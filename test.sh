#!/bin/bash

s=$1
validity=true

if [[ !( "${#s}" -ge 10 ) ]]
then
    echo password too short , password needs must contain at least 10 characters
	#exit 1
	$validity = false
fi

if [[ !("$s" == *[0-9]* )]]
then
	echo invalid password, password should contain at least 1 digit
	#exit 1 	
	$validity = false

fi

if [[ !(("$s" == *[A-Z]*) && ("$s" == *[a-z]*))]]
then
	echo Invalid password ,password should include both the small and capital case letters.
	#exit 1
	$validity = false
fi
if [ $validity = false ]
then
	exit 1
else
	echo "password is valid (-: thanks"
fi

