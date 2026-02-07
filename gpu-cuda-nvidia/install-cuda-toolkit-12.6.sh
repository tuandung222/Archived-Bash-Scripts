#!/bin/bash
# Description: Install CUDA Toolkit 12.6 on Ubuntu
# Usage: bash install-cuda-toolkit-12.6.sh

set -e

echo "Downloading CUDA repository configuration..."
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb

echo "Installing CUDA repository..."
sudo dpkg -i cuda-keyring_1.1-1_all.deb

echo "Updating package list..."
sudo apt-get update

echo "Installing CUDA Toolkit 12.6..."
sudo apt-get -y install cuda-toolkit-12-6

echo "Creating symbolic link..."
sudo ln -sf /usr/local/cuda-12.6 /usr/local/cuda

echo "CUDA Toolkit 12.6 installation complete!"
echo "Add to your .bashrc:"
echo "  export PATH=/usr/local/cuda/bin:\$PATH"
echo "  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH"
