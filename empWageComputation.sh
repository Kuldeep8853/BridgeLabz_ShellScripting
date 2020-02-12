#!/bin/bash/

echo "Calculate Daily Employee wage"
calculateEmpWage(){
	TotalWage=0
	WagePerHour=20
	DailyWage=$(( $WagePerHour*8 ))
	for(( i=1;i<=20;i++ ))
	do
		n=$(( RANDOM%5 ))
		if(( n>0 ))
		then
			TotalWage=$(( $TotalWage+$DailyWage ))
		fi
	done
	echo "$TotalWage $"
}
fullTime=$( calculateEmpWage )
echo "Full time work wage of the employee $fullTime "
