#!/bin/bash
file_path=$1
search_str=$2
replace_str=$3

if [ ! -f "$file_path" ]; then
    echo "Файл не найден: $file_path"
    exit 1
fi

if grep -q "^$search_str$" $file_path; then
    sed -i '' "s/$search_str/$replace_str/g" $file_path
    echo "Замена выполнена успешно в файле: $file_path"
fi

echo "($file_path - $(ls -lh $file_path | awk '{print $5}') - $(date +"%d-%m-%Y %H:%M") - $(shasum -a 256 < $file_path)  sha256)" >> files.log
