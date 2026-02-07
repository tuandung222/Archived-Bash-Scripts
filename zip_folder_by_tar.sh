# tar -czvf archive.tar.gz .

#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <output_filename>"
    exit 1
fi

DIR_PATH=$1
OUTPUT_FILE=$2

# Ensure the directory exists
if [ ! -d "$DIR_PATH" ]; then
    echo "Error: Directory '$DIR_PATH' does not exist."
    exit 1
fi

# Compress the directory
tar -czvf "$OUTPUT_FILE.tar.gz" -C "$(dirname "$DIR_PATH")" "$(basename "$DIR_PATH")"

echo "Compression complete: $OUTPUT_FILE.tar.gz"
