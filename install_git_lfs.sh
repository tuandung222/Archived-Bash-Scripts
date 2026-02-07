#!/bin/bash
# alias sudo=

# Update package lists
sudo apt update

# Install Git LFS
sudo apt install -y git-lfs

# Initialize Git LFS
git lfs install

# Verify installation
git lfs --version

echo "Git LFS installation completed!"
