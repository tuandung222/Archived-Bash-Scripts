#!/bin/bash
# Description: Install and enable Hugging Face transfer acceleration
# Usage: bash setup-hf-transfer.sh

set -e

BASHRC="$HOME/.bashrc"

echo "Installing hf_transfer..."
pip install -U hf_transfer

echo "Backing up .bashrc..."
cp "$BASHRC" "${BASHRC}.backup.$(date +%Y%m%d_%H%M%S)"

echo "Enabling HF_HUB_ENABLE_HF_TRANSFER..."
# Remove old entry if exists
sed -i '/export HF_HUB_ENABLE_HF_TRANSFER=/d' "$BASHRC"

# Add new configuration
echo 'export HF_HUB_ENABLE_HF_TRANSFER=1' >> "$BASHRC"

echo "HF Transfer acceleration configured!"
echo "Reload your shell with: source ~/.bashrc"
