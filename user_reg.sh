#! /bin/bash -x
#validating user first name and last name

read -p "enter First name---" first_name
read -p "enter Last name---" Last_name
fname_pat="^([A-Z]{1}){3,}$"
Lname_pat="^([A-Z]{1}){3,}$"

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
