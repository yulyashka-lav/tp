#!/bin/bash
directory_input="$1"
directory_output="$2"
dop="1"
copirovanie() { 
    local directory="$1" 
    for i in "$directory"/*; do
        if [ -f "$i" ]; then
            file=$(basename "$i")
            if [ -e "$directory_output/$file" ]; then
                file="${file%.*}${dop}${file##*.}"
                ((dop++))
            fi
            cp "$i" "directory_output/$file"
        elif [ -d "$i" ]; then
            copirovanie "$i"
        fi
    done
}
copirovanie "$directory_input" 