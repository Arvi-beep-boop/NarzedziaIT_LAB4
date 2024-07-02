#!/bin/bash

if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
# Tworzenie 100 plików logx.txt
for i in {1..100}
do
    filename="log${i}.txt"
    current_date=$(date)
    # Zapisanie informacji do pliku
    echo "Nazwa pliku: $filename" > $filename
    echo "Nazwa skryptu: $0" >> $filename
    echo "Data: $current_date" >> $filename
done
echo "Utworzono 100 plików logx.txt"
else
    echo "Wrong arguments"
fi
