#!/bin/bash
# Description: Download and start VS Code remote tunnel
# Usage: bash vscode_tunnel.sh

set -e

echo "Downloading VS Code CLI..."
curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz

echo "Extracting..."
tar -xf vscode_cli.tar.gz

echo "Starting VS Code tunnel..."
./code tunnel
