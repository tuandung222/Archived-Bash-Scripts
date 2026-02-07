#!/bin/bash
# Description: Install Jenkins on Ubuntu/Debian
# Usage: bash install-jenkins.sh

set -e

echo "Adding Jenkins repository..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Installing Jenkins..."
sudo apt-get update
sudo apt-get install -y jenkins

echo "Jenkins installation complete!"
echo "Access Jenkins at: http://localhost:8080"
echo "Get initial admin password with: sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
