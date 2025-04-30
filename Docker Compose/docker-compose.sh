#!/bin/bash

set -e  # Exit on error

# Update package list
echo "🔄 Updating package list..."
sudo apt-get update -y

# Install Docker Compose Plugin
echo "📦 Installing Docker Compose Plugin..."
sudo apt-get install -y docker-compose-plugin

# Verify Docker Compose installation
echo "🔍 Verifying Docker Compose version..."
docker compose version
