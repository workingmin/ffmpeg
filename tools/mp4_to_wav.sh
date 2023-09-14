#!/usr/bin/env bash

workdir="$(dirname $0)"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input-dir> <out-dir>"
    exit 0
fi

input_dir="$(realpath -es $1)"
out_dir="$(realpath -es $2)"

function converter() {
    IFS=$'\n'
    for f in `ls $1`
    do
        if [ -d "$1"/"$f" ]; then
            converter "$1"/"$f" "$2"/"$f"
        else
            if [ "${f##*.}" == "mp4" ]; then
                if [ ! -d "$2" ]; then
                    mkdir -p "$2"
                fi
                bash $workdir/converter.sh "$1"/"$f" "$2"/"${f%.*}.wav"
            fi
        fi
    done
}

converter "$input_dir" "$out_dir"
