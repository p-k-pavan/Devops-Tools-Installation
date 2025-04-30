#!/bin/bash

# Exit on any error
set -e

echo "⬇️ Downloading Helm install script..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

echo "🔐 Setting executable permissions..."
chmod 700 get_helm.sh

echo "⚙️ Running Helm install script..."
./get_helm.sh

echo "✅ Helm installation completed!"
