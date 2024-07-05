#!/bin/bash
REPO_URL="https://github.com/Arvi-beep-boop/NarzedziaIT_LAB4.git"

if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    date
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
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
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "--date wyświetli aktualną datę"
    echo "--logs utworzy 100 plików logx.txt"
    echo "--logs <number> utworzy daną liczbę plików log.txt"
elif [ "$1" == "--init" ]; then
    git clone "$REPO_URL"
    repo_name=$(basename "$REPO_URL" .git)
    repo_path=$(pwd)/$repo_name
    export PATH=$PATH:$repo_path
    echo "Repozytorium zostało sklonowane do $repo_path"
    echo "Dodano $repo_path do zmiennej PATH"
else
    echo "Nieprawidłowe argumenty"
fi
