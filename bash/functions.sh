#!/bin/bash

calculate_sha256sum() {
   local file_path="$1"
   sha256sum "$file_path"

}

calculate_sha256sum "read.txt"

