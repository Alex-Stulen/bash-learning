#!/bin/bash


# Цикл for
#
# Syntax:
#
# Примечение: в списке значений <array> значения нужно указывать через пробел
#
# for <var> in <array>
# do
# 	действие, каждый раз переменная
# 	принимает следующее значение 
# 	из списка
# done
#
# ИЛИ
#
# for (( i=0; i<10; i++ ))
# do
# 	echo "$i"
# done
#
# Спец. конструкции:
#
# break - прервать выполнение цикла
# continue - перейти на следующую итерацию
#
#
# Цикл while
#
# Syntax:
#
# while [[ условие ]]
# do
# 	действие, пока условие истинно
# done


# for, пример:

# создает файлы с названием file<i>.txt, если файл с таким именем не существует
# for i in 1 2 3 4 5
# do
# 	file_name=file${i}.txt
# 	if [[ -e $file_name ]]
#	then
#		continue
#	fi
#	echo "Creating file $file_name"
#	touch $file_name
# done


# while, пример:

# просит ввести пользователя любое имя. И спрашивает хочет пользователь продолжить или нет
# again=yes
# while [[ $again == "yes" ]]
# do
#	echo "Please enter a name:"
#	read name
#	echo "The name you entered is '$name'"
#
#	echo "Do you wish to continue (yes/no)"
#	read again
#
#	if [[ $again != 'yes' && $again != 'no' ]]
#	then
#		echo "Unknown command"
#		break
#	fi
# done

# echo 'Bye!'


while true
do
    echo "enter your name:"
    read name

    if [[ -z $name ]]
    then
	break
    fi
    
    echo "enter your age:"
    read age

    if [[ $age == "0" ]]
    then
        break
    fi
    
    group=unknown
    
    if [[ $age -le 16 ]]
    then
        group=child
    elif [[ $age -ge 17 && $age -le 25 ]]
    then
        group=youth
    elif [[ $age -gt 25 ]]
    then
        group=adult
    fi

    echo "$name, your group is $group"

done

echo "bye"
