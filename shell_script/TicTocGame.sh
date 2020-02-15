#!/bin/bash
declare -A matrix
num_row=3
num_coloum=3 
computervalue=-1
uservalue=1
flag=0
k=0

function BoardInitialize()
{
	echo "board initialize : "
	for ((i=0;i<$num_row;i++)) do 
		for ((j=0;j<num_coloum;j++)) do
			matrix[$i,$j]=$flag
		done
	done
}

function computerTurn()
{
 	echo "computer turn : "
	while :
	do 
		i=$(($RANDOM % 3))
		j=$(($RANDOM % 3))
		if  [ "${matrix[$i,$j]}" == "0" ] 
		then
			matrix[$i,$j]=$computervalue
			break;
		else
			echo "trying again"
		fi
	done
}

function userTurn()
{
	echo "user turn : "
	while :
        do
		echo "enter i :"
                read p
                echo "enter j"
		read q
                if [ "${matrix[$p,$q]}" == "0" ]
                then
			matrix[$p,$q]=$uservalue
                        break;
		else
			echo "trying again"
                fi
        done
	
}


function printBoard()
{
	echo "board status"
	echo "---------------"
	for ((i=0;i<$num_row;i++)) 
	do
		for ((j=0;j<$num_coloum;j++))
		do
			if [  "${matrix[$i,$j]}" == "0" ] 
			then
				echo -en " _ "
			fi

			if [  "${matrix[$i,$j]}" == "1" ]
                        then
                            echo -en " 0 "
                        fi

			if [  "${matrix[$i,$j]}" == "-1" ]
                        then
                            echo -en " * "
                        fi

         	done
		echo " "

	done
}


function checkResult() 
{
	local times=2
	for ((i=0;i<$times;i++))
	do
		for ((j=0;j<$num_row;j++))
		do
			temp=0;
			for ((k=0;k<$num_coloum;k++))
			   do
				   if [ "$i" == "0" ]
				   then
				   	temp=$(( $temp + ${matrix[$j,$k]} ))
			   	   else
					temp=$(( $temp + ${matrix[$k,$j]} ))
			   	   fi
			   done
			   if [ "$temp" == "3" ];then
				   echo "user won!!!"
				   exit 0
			   fi

			   if [ "$temp" == "-3" ];then
				echo "computer won!!!"
				exit 1
			   fi
		done
	done

	if [ "$(( ${matrix[0,0]} +  ${matrix[1,1]} +  ${matrix[2,2]} ))" == "3" ]
	then
		echo "user won"
		exit 1
	fi
	
	if [ "$(( ${matrix[0,2]} +  ${matrix[1,1]} +  ${matrix[2,0]} ))" == "-3" ]
	 then
                echo "user won"
		exit 1
        fi
	
	 if [ "$k" == "8" ]
        then
		echo "k : $k and draw"
                exit 1
        fi
}

echo "start tic tac toe"
times=1
BoardInitialize
printBoard
k=0
while [ $k -lt 9 ]
do
	computerTurn
	k=$(($k + 1))
	printBoard
	checkResult
	userTurn
	k=$(($k + 1))
	printBoard
	checkResult
done
