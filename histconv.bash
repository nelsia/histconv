#!/bin/bash

check_args() {
  if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <.bash_history_file_path>"
    echo "Example: $0 ~/.bash_history"
    exit 1
  fi
}

check_args "$@"
HISTORY_FILE_PATH="$1"

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
}' "$HISTORY_FILE_PATH"

