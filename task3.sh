#!/bin/bash

read -p "Введите слово для замены: " w_old
read -p "Введите новое слово: " w_new
read -p "Введите путь к папке с текстовыми файлами: " directory
touch cl.txt

for file in "$directory"/*.txt; do
    if grep -q "$w_old" "$file"; then
        sed -i "s/$w_old/$w_new/g" "$file"
        echo "$file" >> cl.txt
    fi
done

echo "Замена слова '$w_old' на '$w_new' выполнена."
echo "Список измененных файлов сохранен в файле 'cl.txt'."
