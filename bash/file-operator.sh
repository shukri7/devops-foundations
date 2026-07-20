#!/bin/bash 
pwd
ls

process_file () {
local file_path="$1"

cat "$file_path" | while IFS= read -r line; do
   echo "Processing line: $line"

done 
}

process_file  "/home/shukri/log.txt"