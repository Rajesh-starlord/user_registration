#! /bin/bash -x
#validating user first name last name and email and phone no

read -p "enter First name---" first_name
fname_pat="^([A-Z]{1}){3,}$"
read -p "enter Last name---" Last_name
Lname_pat="^([A-Z]{1,}){3,}"
read -p "enter your email--" email
email_pat="^([a-zA-Z])*[_\+\.\-]*[0-9a-zA-Z]+[@][0-9a-zA-Z_\+\.]+[co|in|com|au]$"
read -p "enter phone no ---" phone
phone_pat="^((\+){1}91)[ ]{1}[1-9]{1}[0-9]{9}$"
read -p "enter passwrd---" passwrd
one_upper="[A-Z]+"
no_of_char="${#passwrd}"
char="[a-z]+"

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

if [[ $phone =~ $phone_pat ]];
then
   echo "number successfully registered:"
else
   echo "enter a valid phone number:"
fi

if [[ $no_of_char -ge 8 ]] && [[ $passwrd =~ $one_upper ]] && [[ $passwrd =~ $char ]];
then
   echo "passwrd successfully registered:"
else
   echo "invalid passwrd:"
fi


