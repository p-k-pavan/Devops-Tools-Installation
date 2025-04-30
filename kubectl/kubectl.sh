#!/bin/bash

set -e

echo "📦 Downloading latest stable kubectl..."
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2024-12-20/bin/linux/amd64/kubectl

echo "🔐 Making kubectl executable..."
chmod +x ./kubectl

echo "🚀 Moving kubectl to /usr/local/bin..."
sudo mv kubectl /usr/local/bin/

echo "✅ kubectl installation complete!"
kubectl version --short --client
