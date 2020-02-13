#!/bin/bash/ 

echo "Calculate Daily Employee wage"
calculateEmpWage(){
	TotalWage=0
	WagePerHour=20
	DailyWage=$(( $WagePerHour*8 ))
	for(( i=1;i<=20;i++ ))
	do
		num=$(( RANDOM%5 ))
		if(( num>0 ))
		then
			TotalWage=$(( $TotalWage+$DailyWage ))
		fi
	done
	echo "$TotalWage "
}
fullTime=$( calculateEmpWage )

echo "Add Part time Employee & wage"
calculatePartTimeEmpWage(){
		PerDayHour=4
		WagePerHour=20
		EmpWage=$(( $WagePerHour*$PerDayHour ))
	echo $EmpWage
}
EmpPartTimeWage=$( calculatePartTimeEmpWage )

echo "Please Enter the how many days part time work: "
read partTime
 for(( i=1;i<=partTime;i++ ))
	do
	partTimeWage=$(( $partTimeWage+$EmpPartTimeWage ))
 done
totalWageOfMonth=$(( $fullTime+$partTimeWage ))
echo "Total Wage of the the month is $totalWageOfMonth"

echo "Calculate the total working hour in the month"
checkWorkHour(){
	totalHour=$(( $1/20 ))
	echo " $totalHour"
}
totalHour=$( checkWorkHour $totalWageOfMonth )
echo "Total working hour of the month $totalHour hour "
