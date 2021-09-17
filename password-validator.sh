#!/bin/bash

s=$1
validity=true

if [[ !( "${#s}" -ge 10 ) ]] 
 then
    echo "$(tput setaf 1)password too short , password needs must contain at least 10 characters"
	validity=false
fi

if [[ !("$s" == *[0-9]* )]] 
 then
	echo "$(tput setaf 1)invalid password, password should contain at least 1 digit"
	validity=false

fi

if [[ !(("$s" == *[A-Z]*) && ("$s" == *[a-z]*))]] 
 then
	echo "$(tput setaf 1)Invalid password ,password should include both the small and capital case letters."
	validity=false
fi
if [ $validity = false ]
 then
	exit 1
else
	echo "$(tput setaf 2)Password is valid (-: thanks"
fi

