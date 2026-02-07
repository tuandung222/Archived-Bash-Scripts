#!/bin/bash
# Description: Install and configure Git Large File Storage (LFS)
# Usage: bash install-git-lfs.sh

set -e

echo "Installing Git LFS..."
sudo apt-get update
sudo apt-get install -y git-lfs

echo "Initializing Git LFS for current user..."
git lfs install

echo "Git LFS installation complete!"
git lfs version
