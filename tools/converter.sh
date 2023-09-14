#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input-file> <out-file>"
    exit 0
fi

ffmpeg -i "$1" "$2"