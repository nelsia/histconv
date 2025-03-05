#!/bin/bash

if [ -z "$1" ] && [ -t 0 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

if [ ! -e "$1" ] && [ -t 0 ]; then
    echo "File does not exist: ${1}"
    exit 1
fi

INPUT_HISTORY="${1:-/dev/stdin}"

awk '
{
    if ($0 ~ /^#[0-9]{10,}$/) {
        timestamp = substr($0, 2)
        cmd="date -d @" timestamp " \"+%Y-%m-%d %H:%M:%S\""
        cmd | getline formatted_time
        close(cmd)
    } else if ($0 !~ /^$/) {
        if (formatted_time != "") {
            print formatted_time " " $0
            formatted_time = ""
        } else {
            print $0
        }
    }
}' "$INPUT_HISTORY"

