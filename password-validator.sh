#!/bin/bash

pass=$1
while getopts f: option
do
case "${option}"
in
f )
 PASS_FILE=${OPTARG}
 pass=$(head -n 1 $PASS_FILE)
 ;;
esac
done


#if [[ $1 -eq "-f" ]]
#then	
#	pass=$(head -n 1 $2)
#	echo "$pass"	
#else
#	pass=$1
#fi
validity=true
echo password entered is $pass
if [[ !( "${#pass}" -ge 10 ) ]]
then
    echo password too short , password needs must contain at least 10 characters
	#exit 1
	validity=false
	echo calidy status is $validity
fi
if [[ !("$pass" == *[0-9]* )]]
then
	echo invalid password, password should contain at least 1 digit
	#exit 1 	
	validity=false
	echo calidy status is $validity
fi
if [[ !(("$pass" == *[A-Z]*) && ("$pass" == *[a-z]*))]]
then
	echo Invalid password ,password should include both the small and capital case letters.
	#exit 1
	validity=false
	echo calidy status is $validity
fi
if [ $validity = false ]
then
	exit 1
else
	echo "password is valid (-: thanks"
fi

