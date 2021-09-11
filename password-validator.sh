#!/bin/bash

# Read passed password (as Default when no flag being used)
pass=$1
echo 
echo "- checking that your password is valid , see results below - "
echo 
# Check for File flag(s) section : 
while getopts f: option
	do
	case "${option}"
		in
		f )	# Password file to read from
			PASS_FILE=${OPTARG}
			pass=$(head -n 1 $PASS_FILE)
			;;
		\?) # Invalid option
			echo "Error: Invalid option"
			exit 1;;
esac
done
# Set default password validity status to true
validity=true
# password length check
if [[ !( "${#pass}" -ge 10 ) ]]
  then
    echo .. -_- Password is too short , password must contain at least 10 characters .. -_-
	# Set validity status to false
	validity=false
fi
# Digit existance check
if [[ !("$pass" == *[0-9]* )]]
  then
	echo ... -_- Password MUST contain at least 1 digit... -_- 
	validity=false
fi
# Characters existance (Upper & Lower) check
if [[ !(("$pass" == *[A-Z]*) && ("$pass" == *[a-z]*))]]
  then
	echo .... -_- Password MUST include both the small and capital case letters .... -_- 
	validity=false
fi
# Exit when password found invalid due to at least one of the conditions
if [ $validity = false ]
  then
	exit 1
# Feedback for valid password which meets the reuirements
else
	echo "password is valid (-: thanks"
fi

