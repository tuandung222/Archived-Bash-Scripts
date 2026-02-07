#!/bin/bash
# Description: Install Node.js 22 using NVM
# Usage: bash install-nodejs.sh

set -e

echo "Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node.js 22..."
nvm install 22
nvm use 22

echo "Node.js installation complete!"
echo "Verify with:"
echo "  node --version"
echo "  npm --version"
