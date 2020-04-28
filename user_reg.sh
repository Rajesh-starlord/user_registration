#! /bin/bash -x
#validating user credentials

read -p "enter First name---" first_name
fname_pat="^([A-Z]{1})+[a-z]{2,}$"
read -p "enter Last name---" Last_name
Lname_pat="^([A-Z]{1})+[a-z]{2,}$"
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

validate_fname () {
	if [[ $first_name =~ $fname_pat ]];
	then
		echo "first name successfully registered:"
		return 1;
	else
		echo "enter a valid first name:"
	fi
}
validate_lname () {

	if [[ $Last_name =~ $Lname_pat ]];
	then
        	echo "Last name successfully registered:"
			return 1;
	else
        	echo "enter a valid Last name:"
	fi
}

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

validate_email () {
	if [[ $email =~ $email_pat ]];
	then
        	echo "emial registered succsessfully"
			return 1;
	else
        	echo "invalid email address:"
	fi
}
validate_phone_no () {
	if [[ $phone =~ $phone_pat ]];
	then
   		echo "number successfully registered:"
			return 1;
	else
   		echo "enter a valid phone number:"
	fi
}
validate_password () {
	if [[ $no_of_char -ge 8 ]] && [[ $passwrd =~ $one_upper ]] && [[ $passwrd =~ $char ]] && [[ $passwrd =~ $atleast_one_no ]] && [[ $one_sp_char -eq 1 ]];
	then
   		echo "passwrd successfully registered:"
			return 1;
	else
   		echo "invalid passwrd:"
	fi
}
all_mail_res () {
        if [[ $check_res -eq 1 ]];
        then
                echo "All emails are not valid:"
        else
                echo "All mails are successfully validated:"
					 return 1;
        fi
}

validate_fname
fname_res=$?
validate_lname
lname_res=$?
validate_email
email_res=$?
validate_phone_no
phone_res=$?
validate_password
pswd_res=$?
check_all_mails
check_res=$?
all_mail_res
all_mail_val=$?

if [[ $fname_res -eq 1 ]] && [[ $lname_res -eq 1 ]] && [[ $email_res -eq 1 ]] && [[ $phone_res -eq 1 ]] && [[ $pswd_res -eq 1 ]] && [[ $all_mail_val -eq 1 ]];
then
	echo "user registration has succesessfully done:"
else
	echo "enter valid credentials:"
fi
