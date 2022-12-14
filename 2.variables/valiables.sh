#!/bin/bash

local_variable="This is local variable" # Локальная переменная, длступная из данного скрипта
export global_variable="This is global variable" # Глобальная переменная, видимая в текущем и в запускаемых программах

# Переменные в bash не имеют типа. Можно считать, что переменная всегда содержит текстовую строку. 
# Если требуется интерпретация переменной как числа, то проводится разбор строки слева.
# Значение определяют цифры до первого нечислового символа.
# Строка не содержащая цифр интерпретируется как 0.
#
# set - выдает список всех переменных с их значениями
#
# VAR="string" - # определяет локальную переменную интерпретатора и присваивает ей значение. Разделителями в команде являются символ = 
# после имени переменной и первый пробел после значения. Пробелы вокруг знака равенства недопустимы. 
# Пробел слева от знака равенства интерпретируется как часть имени, пробел справа - как пустая присваеваемая строка.
# Если строка сожержит пробелы, то она должна быть заключена в кавычки.
#
# $VAR - подстановка значения переменной VAR. При разборе строки именем переменной считается максимальная последовательность из букв, цифр
# и знаков подчеркивания.
#
# ${VAR} - то же что и $VAR позволяет избавиться от неоднозначности при разборе строки.
#
# export VAR - делает переменную доступной для дочерних процессов (делает переменную глобальной)
# export VAR=string - допустимое объявление глобальной переменной
# unset VAR - уничтожает определение переменной
#
# Пример экспорта переменной:
# WORKDIR=/usr/src/linux
# echo $WORKDIR - используем значение переменной
# bash - запустили новую копию интерпретатора
# echo $WORKDIR - переменная недоступна
# exit - завершили копию интерпретатора
# echo $WORKDIR - переменная снова доступна
# export WORKDIR
# bash
# echo $WORKDIR - после экспорта переменная доступна запускаемым программам


# Дополнительные возможности при работе с переменными:
#
# ${VAR-default} - если VAR определена, то ее значение иначе значение default
# ${VAR=default} - если VAR определена, то ее значение иначе значение default и присвоение его VAR
# ${VAR?err_msg} - если VAR определена, то ее значение иначе печать err_msg
#
# Пример подстановки вывода команды whoami в качестве значения по умолчанию:
# echo ${username-'whoami'}
#
# ${#VAR} - длинна значения переменной в символах
# ${#array[*]} или ${#array[@]} - размер массива (Массивы доступны в версии bash > 2)
# ${#*} или ${#@} - число параметров скрипта
#
# ${VAR:pos} - подстрока с позиции pos
# ${VAR:pos:len} - подстрока с позиции pos длинной length
#
#
# В следующих операциях Pattern это выражение в формате glob - * - любая последовательность символов, ? - один символ.
#
# ${VAR/Pattern/Replacement} - замена первого вхождения Pattern на Replacement, если Replacement отсутствует, то Pattern удаляется.
# ${VAR//Pattern/Replacement} - глобальная замена.
# ${VAR#Pattern} - удаление минимальной строки, соответствующей Pattern в начале строки (удаление префикса)
# ${VAR##Pattern} - удаление максимальной строки, соответствующей Pattern в начале строки.
# ${VAR%Pattern} - удаление минимальной строки, соответствующей Pattern в конце строки (удаление суффикса).
# ${VAR%%Pattern} - удаление максимальной строки, соответствующей Pattern в конце строки.
#
# Пример:
#
# VAR="file.test.txt"
# echo ${VAR#file*.} => test.txt
# echo ${VAR##file*.} => txt
# echo ${VAR%.*} => file.test
# echo ${VAR%%.*} => file
