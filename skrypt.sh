#!/bin/bash

if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
  if [ -n "$2" ]; then
        num_files=$2
    else
        num_files=100
    fi
    for i in $(seq 1 $num_files)
    do
        filename="log${i}.txt"
        current_date=$(date)
        # Zapisanie informacji do pliku
        echo "Nazwa pliku: $filename" > $filename
        echo "Nazwa skryptu: $0" >> $filename
        echo "Data: $current_date" >> $filename
    done
    echo "Utworzono $num_files plików logx.txt"
elif [ "$1" == "--help" ]; then
    echo "--date wyświetli aktualną datę"
    echo "--logs utworzy 100 plików logx.txt"
    echo "--logs <number> utworzy daną liczbę plików log.txt"
else
    echo "Nieprawidłowe argumenty"
fi
