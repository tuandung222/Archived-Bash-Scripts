#!/bin/bash
# Description: Display subdirectories sorted by size (largest first)
# Usage: bash view-directory-sizes.sh [directory]

TARGET_DIR="${1:-.}"

echo "Analyzing directory sizes in: $TARGET_DIR"
echo ""

du -h --max-depth=1 "$TARGET_DIR" 2>/dev/null | sort -hr

echo ""
echo "Total size:"
du -sh "$TARGET_DIR"
