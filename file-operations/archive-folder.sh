#!/bin/bash
# Description: Create compressed tar archive from a directory
# Usage: bash archive-folder.sh <source_folder> [output_name]

set -e

# Check arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <source_folder> [output_name]"
    echo "Example: $0 my_folder my_archive.tar.gz"
    exit 1
fi

SOURCE_FOLDER="$1"
OUTPUT_NAME="${2:-${SOURCE_FOLDER}.tar.gz}"

# Validate source folder exists
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Directory '$SOURCE_FOLDER' does not exist"
    exit 1
fi

echo "Creating archive: $OUTPUT_NAME"
tar -czf "$OUTPUT_NAME" "$SOURCE_FOLDER"

echo "Archive created successfully!"
ls -lh "$OUTPUT_NAME"
