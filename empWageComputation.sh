#!/bin/bash/

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
	echo "$TotalWage"
}
fullTime=$( calculateEmpWage )
echo "Full time work wage of the employee $fullTime "

echo "Add Part time Employee & wage"
calculatePartTimeEmpWage(){
	PerDayHour=4
	WagePerHour=20
	EmpWage=$(( $WagePerHour*$PerDayHour ))
	echo $EmpWage
}
EmpPartTimeWage=$( calculatePartTimeEmpWage )
echo "Part time working wage of the employee $EmpPartTimeWage "
totalWage=$(( $fullTime+$EmpPartTimeWage ))
 echo "Total Employee wage $totalWage "

