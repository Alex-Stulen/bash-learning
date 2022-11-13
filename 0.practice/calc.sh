#!/bin/bash

calc () # $1 - num1, $2 - operator, $3 - num2
{
    if [[ $# -ne 3 ]]
    then
        echo "error"
	exit 0
    elif [[ $2 != "+" && $2 != "-" && $2 != '/' && $2 != '*' && $2 != '%' && $2 != '**' ]]
    then
        echo "error"
	exit 0
    else
        echo "$(( $1 $2 $3 ))"    
    fi
}


while true
do
    read num1 operator num2

    if [[ $num1 == "exit" ]]
    then
        echo "bye"
        break
    else
        calc "${num1}" "${operator}" "${num2}"
    fi
done
