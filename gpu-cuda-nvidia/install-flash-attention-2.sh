#!/bin/bash
# Description: Install FlashAttention v2 from source using uv
# Usage: bash install-flash-attention-2.sh
# Requirements: CUDA-compatible GPU, git repository cloned

set -e

echo "Upgrading pip and installing uv..."
pip install --upgrade pip uv

echo "Installing setuptools..."
uv pip install setuptools --link-mode=copy

echo "Installing FlashAttention v2 from source..."
GIT_LFS_SKIP_SMUDGE=1 uv pip install -e ".[dev]" --link-mode=copy --no-build-isolation

echo "FlashAttention v2 installation complete!"
echo "Test with: python -c 'import flash_attn; print(flash_attn.__version__)'"
