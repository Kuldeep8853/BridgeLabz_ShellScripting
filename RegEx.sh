#!/bin/bash/ 
checkFname(){
	printf "Enter your Fname: "
	read Fname
	if [[ $Fname =~ ^[[:upper:]]{1}[[:lower:]]*$ ]];
	then
		echo "Valid first name"
	else
		echo " Invalid first name"
		read Fname
	fi
}
checkFname

checkLname(){
	printf "Enter your last name: "
	read Lname
	if [[ $Lname =~ ^[[:upper:]]{1}[[:lower:]]*$ ]];
	then
		echo "valid Last name"
	else
		echo"Invalid Last name"
	fi
}
checkLname

checkMobileNo(){
	printf "Enter your mobile No.: "
	read mobile
	if [[ $mobile =~ ^[+91]{3}[[:space:]]{1}[[:digit:]]{10}$ ]];
	then
		echo "Valid mobile no."
	else
		echo "Invalid mobile number"
	fi
}
checkMobileNo

checkEmail(){
	printf "Enter the Email id: "
	read Email
	if [[ $Email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[com]{3}$ ]];
	then
		echo "Valid Email Id"
	else
		echo "Invalid Email id"
	fi
}
checkEmail

checkPwd(){
	echo "Enter the password minimun 8 charecter and must be including special characters"
	read pwd
	if [[ $pwd =~ [a-z,A-Z,0-9,#%^*]{8,} ]];
	then
		echo "Valid PassWord"
	else
		echo "Invelid PassWord"
	fi
}
checkPwd
