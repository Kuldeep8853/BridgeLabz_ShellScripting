#!/bin/bash/
echo "Welcome to Employee Wage Computational program on Master Branch"
echo "Check the employee present or absent"
checkPresentAbsent(){
	present=0
	for(( i=1;i<=20;i++ ))
	do
		n=$(( RANDOM%5 ))
		if(( n>0 ))
		then
			present=$(( $present+1 ))
		fi
	done
	echo $present
}
present=$( checkPresentAbsent )
echo "Employee present $present days of 20 office days"
