#!/bin/bash

# Title: Jenkins Installation on Amazon Ubuntu
# Description: Installs Jenkins on Ubuntu and configures necessary dependencies.
# Author: Pavan Umar
# Usage: bash install_jenkins.sh
# Note: Run as a user with sudo privileges

set -e  # Exit on error

echo "🔑 Downloading Jenkins GPG key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "📂 Adding Jenkins repository to apt sources..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating package list..."
sudo apt-get update

echo "📦 Installing dependencies (fontconfig and OpenJDK 21)..."
sudo apt install -y fontconfig openjdk-21-jre

echo "🚀 Installing Jenkins..."
sudo apt-get install -y jenkins

echo "✅ Jenkins installation complete!"

# Show Jenkins status and auto-start
echo "🔄 Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Display Jenkins status
echo "🔍 Jenkins service status:"
sudo systemctl status jenkins | head -n 10

# Retrieve the Jenkins initial admin password
echo "🔑 Retrieving Jenkins initial admin password..."
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Jenkins initial setup instructions
echo "🔐 To complete Jenkins setup, open your browser and navigate to: http://<your-server-ip>:8080"
echo "🔑 Use the following Jenkins initial admin password"

