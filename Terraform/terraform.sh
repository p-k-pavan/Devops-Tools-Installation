#!/bin/bash

set -e  # Exit on error

echo "🔄 Updating package list..."
sudo apt-get update -y

# Install prerequisites
echo "📦 Installing necessary packages..."
sudo apt-get install -y gnupg software-properties-common wget

# Add the HashiCorp GPG key
echo "🔑 Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Verify the GPG key fingerprint
echo "🔍 Verifying HashiCorp GPG key..."
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Add the HashiCorp repository to APT sources
echo "📂 Adding HashiCorp repository to APT sources..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

# Update package list again after adding the repository
echo "🔄 Updating package list again..."
sudo apt update -y

# Install Terraform
echo "📦 Installing Terraform..."
sudo apt-get install -y terraform

# Verify the installation
echo "🔍 Verifying Terraform installation..."
terraform -version
