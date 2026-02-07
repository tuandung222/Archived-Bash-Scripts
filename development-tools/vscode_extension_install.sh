#!/bin/bash
# Description: Backup and restore VS Code extensions
# Usage: bash vscode_extension_install.sh

set -e

echo "Exporting VS Code extensions list..."
code --list-extensions > extensions.txt
echo "Extensions list saved to extensions.txt"

echo ""
echo "To install all extensions from the file, run:"
echo "  cat extensions.txt | xargs -L 1 code --install-extension"
