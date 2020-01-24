#!/bin/bash/ 
declare -a char
char=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9)
CouponCode=""
l=${#char[@]}
for(( j=1;j<=5;j++ ))
	do
		for(( i=0;i<$l/2;i++ ))
		do
			random=$(( $RANDOM%$l ))
			c=${char[$random]}
			printf $c
		done
		echo
done
