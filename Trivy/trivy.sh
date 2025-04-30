#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "🔄 Updating package index and installing required packages..."
sudo apt-get update
sudo apt-get install -y wget gnupg

echo "🔑 Adding Trivy GPG key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "📂 Adding Trivy repository to sources list..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | \
  sudo tee /etc/apt/sources.list.d/trivy.list > /dev/null

echo "🔄 Updating package list again..."
sudo apt-get update

echo "🔍 Installing Trivy..."
sudo apt-get install -y trivy

echo "✅ Trivy installation complete!"
trivy --version
