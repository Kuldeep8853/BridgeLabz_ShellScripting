echo "enter the year (YYYY)"
read year
if [ $((year%4)) -eq 0 ]
then 
	if [ $((year%100)) -eq 0 ]
	then 
		if [ $((year%400)) -eq 0 ]
		then
			echo "its leap year. "
		else
         echo "Its not leap year."
		fi
	else 
		echo "Its leap year. "
	fi
else
  echo "Its not leap year. "
fi 
