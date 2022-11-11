#!/bin/bash

# Ветвление: основы

# Syntax:
# 
# if [[ условие ]]
# then
# 	действие, если условие истинно
# fi конец конструкции

# Условия (строки):
# -z <string> - строка пустая
# -n <string> - строка НЕ пустая
# <string1> == <string2> - строки равны
# <string1> != <string2> - строки НЕ равны

# Пример:

if [[ -z $1 ]] 
then
	echo "First arg empty!"
fi

if [[ $var1 == $var2 ]] 
then
	echo "\$var1 == \$var2. \$var1 = $var1, \$var2 = $var"
fi

# Условия [числа(строки)]:
# <число/строка> <операция> <число/строка>
#
# -eq, (==) - равно
# -ne, (!=) - НЕ равно
# -lt, (<)  - меньше
# -le,      - меньше или равно
# -gt, (>)  - больше
# -ge,      - больше или равно

# Условия (файлы):
# -e <путь> - путь существует
# -f <путь> - это файл
# -d <путь> - это директория
# -s <путь> - размер файла больше 0
# -x <путь> - файл исполняемый

# Условия (логические):
# !  - отрицание логическое выражение 
# && - "И"
# || - "ИЛИ"

# Пример:

echo 'Hi!'

if [[ $# -lt 2 ]]
then
	echo 'You should specify at least two arguments!'
	exit
fi

if [[ !(-e $1) || !(-f $1) ]]
then
	echo "File $1 doesn't exist or is not a file!"
	exit
fi

cp $1 $2
echo "Copied $1 to $2"


# Ветвление: альтернатива (else)

# Syntax:
# 
# if [[ условие ]]
# then
# 	действие, если условие истинно
# else
# 	действие, если условие ложно
# fi
#
# Замечание: конструкций elif может быть бесконечное множество
#
# if [[ условие ]]
# then
# 	действие, если условие1 истинно
# elif [[ условие2 ]]
# then
# 	действие, если условие2 истинно
# else
# 	действие, если все условия выше ложные
# fi

# Ветвление (case)
# Замечение: конструкций <case> может быть бесконечное множество. 
# ;; - выйти из блока, эквивалентно brake в python
# 
# Syntax:
#
# case <var> in
# <case1>)
# 	действие, если <var> == <case1>
# 	;;
# <case2>)
#	действие, если <var> == <case1>
#	;;
# *)
#	действие, если <var> не равна ни одному из вариантов
# esac
#
# Пример:

if [[ $# -ne 2 ]]
then
	echo 'You should specify exactly two args!'
	exit
else
	case $1 in
		1)
			echo "Creating file $2"
			touch $2
			;;
		2)
			echo "Creating dir $2"
			;;
		*)
			echo 'Wrong value!'
	esac
fi