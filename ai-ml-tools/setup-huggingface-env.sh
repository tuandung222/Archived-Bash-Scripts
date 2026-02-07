#!/bin/bash
# Description: Configure Hugging Face cache and environment variables
# Usage: bash setup-huggingface-env.sh

set -e

BASHRC="$HOME/.bashrc"

echo "Backing up .bashrc..."
cp "$BASHRC" "${BASHRC}.backup.$(date +%Y%m%d_%H%M%S)"

echo "Configuring Hugging Face environment variables..."

# Remove old entries if they exist
sed -i '/export HF_HOME=/d' "$BASHRC"
sed -i '/export HF_DATASETS_CACHE=/d' "$BASHRC"
sed -i '/export TRANSFORMERS_CACHE=/d' "$BASHRC"

# Add new configuration
cat >> "$BASHRC" << 'ENVEOF'

# Hugging Face Configuration
export HF_HOME="$HOME/.cache/huggingface"
export HF_DATASETS_CACHE="$HF_HOME/datasets"
export TRANSFORMERS_CACHE="$HF_HOME/transformers"
ENVEOF

echo "Hugging Face environment configured!"
echo "Reload your shell with: source ~/.bashrc"
