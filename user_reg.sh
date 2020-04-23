#! /bin/bash -x
#validating user password-4

read -p "enter First name---" first_name
fname_pat="^([A-Z]{1}){3,}$"
read -p "enter Last name---" Last_name
Lname_pat="^([A-Z]{1,}){3,}$"
read -p "enter your email--" email
email_pat="^([a-zA-Z])*[_\+\.\-]*[0-9a-zA-Z]+[@][0-9a-zA-Z_\+\.]+[co|in|com|au]$"
read -p "enter phone no ---" phone
phone_pat="^((\+){1}91)[ ]{1}[1-9]{1}[0-9]{9}$"
read -p "enter passwrd---" passwrd
one_upper="[A-Z]+"
char="[a-z]+"
atleast_one_no="[0-9]+"
no_of_char="${#passwrd}"
one_sp_char=`echo $passwrd | grep -o "\!\|\@\|\#\|\$\|\%\|\^\|\&\|\*" | wc -l`

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
check_all_mails () {

	declare -a emails
	for((i=0;i<9;i++))
	do
   	emails[i]=`cat email.csv| awk '{if(NR==$i+1) print $0}'`
	done
	length=${#emails[@]}
	echo $length
	echo ${emails[@]}
	for((j=0;j<$length;j++))
	do
   	if [[ ${emails[$j]} =~ $email_pat ]];
   	then
         echo "valid"
   	else
         echo "invalid"
			return 1
   	fi
	done

}

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

if [[ $no_of_char -ge 8 ]] && [[ $passwrd =~ $one_upper ]] && [[ $passwrd =~ $char ]] && [[ $passwrd =~ $atleast_one_no ]] && [[ $one_sp_char -eq 1 ]];
then
   echo "passwrd successfully registered:"
else
   echo "invalid passwrd:"
fi

check_all_mails
check_res=$?
if [[ $check_res -eq 1 ]];
then
        echo "All emails are not valid:"
else
        echo "All mails are successfull validated:"
fi
