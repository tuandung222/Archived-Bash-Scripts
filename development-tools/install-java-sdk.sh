#!/bin/bash
# Description: Install OpenJDK on Ubuntu/Debian
# Usage: bash install-java-sdk.sh [version]
# Example: bash install-java-sdk.sh 17

set -e

VERSION="${1:-17}"

echo "Installing OpenJDK ${VERSION}..."
sudo apt-get update
sudo apt-get install -y "openjdk-${VERSION}-jdk"

echo "Java installation complete!"
java -version
