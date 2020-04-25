#! /bin/bash -x
#validating user first name

read -p "enter First name---" first_name
fname_pat="^([A-Z]{1})+[a-z]{2,}$"
if [[ $first_name =~ $fname_pat ]];
then
	echo "first name successfully registered:"
else
	echo "enter a valid first name:"
fi
