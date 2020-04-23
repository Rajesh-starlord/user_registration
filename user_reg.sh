#! /bin/bash -x
#validating user first name last name and email

read -p "enter First name---" first_name
fname_pat="^([A-Z]{1}){3,}$"
read -p "enter Last name---" Last_name
Lname_pat="^([A-Z]{1,}){3,}"
read -p "enter your email--" email
email_pat="^([a-zA-Z])+[_\+\.\-]*[0-9a-zA-Z]+[@][0-9a-zA-Z_\+\.]+[co|in|com|au]$"

if [[ $first_name =~ $fname_pat ]];
then
	echo "first name successfully registered:"
else
	echo "enter a valid first name:"
fi

if [[ $Last_name =~ $Lname_pat ]];
then
        echo "Last name successfully registered:"
else
        echo "enter a valid Last name:"
fi

if [[ $email =~ $email_pat ]];
then
        echo "emial registered succsessfully"
else
        echo "invalid email address:"
fi
