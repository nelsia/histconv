#!/bin/bash

INPUT_HISTORY="${1:-/dev/stdin}"

awk '
{
    if ($0 ~ /^#[0-9]+$/) {
        timestamp = substr($0, 2)
        cmd="date -d @" timestamp " \"+%Y-%m-%d %H:%M:%S\""
        cmd | getline formatted_time
        close(cmd)
    } else {
        if (formatted_time != "") {
            print formatted_time " " $0
            formatted_time = ""
        } else {
            print $0
        }
    }
}' "$INPUT_HISTORY"

