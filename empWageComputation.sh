#!/bin/bash/ 
echo "Welcome to Employee Wage Computation program on Master Branch"
echo "Check Employee present or absent"
checkEmpPresentAbsent(){
	present=0
	for(( i=1;i<=20;i++ ))
	do
		num=$(( RANDOM%5 ))
		if(( num>0 ))
		then
			present=$(( $present+1 ))
		fi
	done
	echo $present
}
present=$( checkEmpPresentAbsent )
echo "Employee $present days present in 20 office days"

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

echo "Please Enter the choice: "
echo "1. Calculate the full time employee total wage and along daily wage "
echo "2. Calculate the part time employee total wage..."
echo "3. Calculate the total wage of employee..."
read choice
case $choice in
1)
	echo "Full time work wage of the employee $fullTime"
        echo "Full time per day wage is 160 and part time per day wage is 80"
;;
2)
	echo "Part time working wage of the employee $EmpPartTimeWage $"
;;
3)
	totalWage=$(( $fullTime+$EmpPartTimeWage ))
 	echo "Total Employee wage $totalWage $"
;;

*)
	echo "Enter the valid choice!! "
 esac

echo "Please Enter the how many days part time work: "
read partTime
 for(( i=1;i<=partTime;i++ ))
	do
	partTimeWage=$(( $partTimeWage+$EmpPartTimeWage ))
 done
totalWageOfMonth=$(( $fullTime+$partTimeWage ))
echo "Total Wage of the the month is $totalWageOfMonth"
echo " do the $partTimeDays days part time and complete the remaining hour" 

echo "Calculate the total working hour in the month"
checkWorkHour(){
	totalHour=$(( $1/20 ))
	echo " $totalHour"
}
totalHour=$( checkWorkHour $totalWageOfMonth )
echo "Total working hour of the month $totalHour hour "

echo "Total working of the month 20 days and 150 hour"
totalWageOfMonth=$(( 150*20 ))
if(( $fullTime < $totalWageOfMonth ))
then
	RemainingWage=$(( $totalWageOfMonth-$fullTime ))
fi
remainingHour=$(( $RemainingWage/20 ))
echo "Remaining hour of the month $remainingHour and complete remaining hour doing part time work"
partTimeDays=$(( $remainingHour/4 ))

