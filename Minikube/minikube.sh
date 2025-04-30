#!/bin/bash

# Download and install Minikube
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Start Minikube
echo "🚀 Starting Minikube..."
minikube start

# Check pods using existing kubectl
echo "📦 Getting pods in all namespaces using kubectl (if installed)..."
kubectl get po -A || echo "⚠️ kubectl not found. You can use minikube's built-in kubectl."

# Optional: Alias for ease of use
echo '👉 Tip: Add this to your shell config (e.g., ~/.bashrc or ~/.zshrc) to use minikube kubectl by default:'
echo 'alias kubectl="minikube kubectl --"'
alias kubectl="minikube kubectl --
