#!/bin/bash

set -e  # Exit on error

echo "📦 Downloading latest eksctl..."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

echo "🚀 Moving eksctl to /usr/local/bin..."
sudo mv /tmp/eksctl /usr/local/bin

echo "✅ eksctl installation complete!"
eksctl version
