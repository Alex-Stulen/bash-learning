#!/bin/bash


gcd () # two params, both integer type
{	
	if [[ $# -eq 0 ]]
	then
		echo "bye"
	fi

	m=$1
	n=$2
	
	if [[ -z $m ]]
	then
		echo "bye"
	elif [[ -z $n ]]
	then
		echo "bye"
	fi

	if [[ $m -eq $n ]]
	then
		echo "GCD is $m"
	elif [[ $m -gt $n ]]
	then
		let "temp=$m-$n"
		gcd $temp $n
	else
		let "temp=$n-$m"
		gcd $m $temp
	fi
}

read num1 num2

if [[ -z $num1 || -z $num2 ]]
then 
	echo "bye"
else
	gcd $num1 $num2
fi

