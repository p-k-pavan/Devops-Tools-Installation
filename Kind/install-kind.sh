#!/bin/bash

set -e  # Exit on any error

ARCH=$(uname -m)

echo "🔍 Detected architecture: $ARCH"

if [ "$ARCH" = "x86_64" ]; then
  echo "⬇️ Downloading kind for x86_64..."
  curl -Lo kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
elif [ "$ARCH" = "aarch64" ]; then
  echo "⬇️ Downloading kind for ARM64..."
  curl -Lo kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-arm64
else
  echo "❌ Unsupported architecture: $ARCH"
  exit 1
fi

echo "🔧 Making kind binary executable..."
chmod +x kind

echo "🚀 Moving kind to /usr/local/bin..."
sudo mv kind /usr/local/bin/kind

echo "✅ kind installation complete!"
kind --version
