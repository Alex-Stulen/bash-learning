#!/bin/bash

# Функции
#
# Syntax:
#
# <func_name> ()
# {
# 	действие
# }


# Вызов функции:
# просто написать имя функции (без скобок)
#
# Привет:
#
# функция которая выводин в консоль "Привет Мир!"
#
# hello_world ()
# {
# 	echo "Привет Мир!"
# }
#
# hello_world (вызов функции)

hello_world ()
{
	echo "Hello world"
}

hello_world


# Функции с параметрами:
#
# <func_name> () 
# {
# 	действие с $1, $2, ... , $#
# }
#	
# Пример:

hello_name()
{
	echo "Hello, $1"
}

hello_name "Alex"


# Переменные в функциях
#
# <func_name> ()
# {
# 	var_global=1
# 	local var_local=1
# }
#
# <func_name> (вызов)
# echo $var_global выведет 1
# echo $var_local  ничего не выведет

test_func ()
{
	var_global=1
	local var_local=1
}

test_func

echo $var_global
echo $var_local

# Компактная запись:
# <func_name> () { действие1; действие2; }
