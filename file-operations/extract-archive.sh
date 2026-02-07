#!/bin/bash
# Description: Extract tar.gz archive
# Usage: bash extract-archive.sh <archive_file>

set -e

# Check if tar is installed
if ! command -v tar &> /dev/null; then
    echo "Installing tar..."
    sudo apt-get update
    sudo apt-get install -y tar
fi

# Check arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <archive_file>"
    echo "Example: $0 my_archive.tar.gz"
    exit 1
fi

ARCHIVE_FILE="$1"

# Validate archive exists
if [ ! -f "$ARCHIVE_FILE" ]; then
    echo "Error: File '$ARCHIVE_FILE' does not exist"
    exit 1
fi

echo "Extracting: $ARCHIVE_FILE"
tar -xzf "$ARCHIVE_FILE"

echo "Archive extracted successfully!"
