#!/bin/bash

# Calculator

if [[ $# -ne 3 ]]
then
	echo "Вы должны указать три аргумента. Первый - число, второй - математический оператор (+, -, * /). Третий - число"
	exit
fi

num1=$1
operator=$2
num2=$3

if [[ $operator != '+' && $operator != '-' && $operator != '*' && $operator != '/' ]]
then
	echo "Недопустимый оператор '$operator'. Оператор должен быть из списка (+, -, *, /)"
	exit
fi

result=$(( $num1 $operator $num2 ))
echo "Результат: $result"
