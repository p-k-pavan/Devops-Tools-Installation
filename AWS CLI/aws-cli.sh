#!/bin/bash

set -e  # Exit on error

echo "🔄 Updating system packages..."
sudo apt update -y

echo "📥 Downloading AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "📦 Installing unzip (if necessary)..."
sudo apt install -y unzip

echo "📂 Extracting AWS CLI installer..."
unzip awscliv2.zip

echo "🔧 Installing AWS CLI v2..."
sudo ./aws/install

# Clean up the installer files
echo "🧹 Cleaning up installer files..."
rm -rf awscliv2.zip aws/

echo "✅ AWS CLI installation complete!"

echo "🔄 Verifying AWS CLI version..."
aws --version

echo "⚙️ Configuring AWS CLI..."
aws configure
