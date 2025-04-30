#!/bin/bash

# Title: Docker Installation on Amazon Ubuntu
# Description: Installs Docker Engine, CLI, containerd, Buildx, and Compose Plugin on Ubuntu.
# Author: Pavan Umar
# Usage: bash install_docker.sh
# Note: Run as a user with sudo privileges

set -e  # Exit on error

echo "🔄 Updating package lists..."
sudo apt-get update -y

echo "📦 Installing prerequisites..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "📁 Creating keyring directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "🔑 Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "📄 Adding Docker repository to apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package lists again..."
sudo apt-get update -y

echo "🐳 Installing Docker Engine, CLI, containerd, Buildx, and Compose..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "👤 Adding current user to 'docker' group..."
sudo usermod -aG docker $USER

echo "✅ Docker installation complete. Please log out and log back in or run: newgrp docker"
