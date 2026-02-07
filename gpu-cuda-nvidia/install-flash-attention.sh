#!/bin/bash
# Description: Install FlashAttention v1 from PyPI
# Usage: bash install-flash-attention.sh
# Requirements: CUDA-compatible GPU, PyTorch installed

set -e

echo "Installing dependencies..."
pip install packaging 
pip uninstall -y ninja && pip install ninja

echo "Installing FlashAttention..."
pip install flash-attn --no-build-isolation

echo "FlashAttention installation complete!"
echo "Test with: python -c 'import flash_attn; print(flash_attn.__version__)'"
