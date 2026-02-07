#!/bin/bash
# Description: Install NVIDIA Container Toolkit for Docker GPU support
# Usage: bash install-nvidia-container-toolkit.sh

set -e

echo "Configuring NVIDIA Container Toolkit repository..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "Updating package list..."
sudo apt-get update

echo "Installing NVIDIA Container Toolkit..."
sudo apt-get install -y nvidia-container-toolkit=1.16.2-1 nvidia-container-toolkit-base=1.16.2-1

echo "Configuring Docker runtime..."
sudo nvidia-ctk runtime configure --runtime=docker

echo "Restarting Docker service..."
sudo systemctl restart docker

echo "NVIDIA Container Toolkit installation complete!"
echo "Test with: docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu22.04 nvidia-smi"
