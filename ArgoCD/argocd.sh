#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "❌ kubectl is not installed. Please install kubectl first."
    exit 1
fi

echo "🔧 Creating namespace 'argocd'..."
kubectl create namespace argocd || echo "Namespace 'argocd' already exists."

echo "📦 Installing Argo CD into 'argocd' namespace..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "⬇️ Downloading Argo CD CLI..."
sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.4.7/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

echo "🌐 Changing Argo CD server service type to NodePort..."
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

echo "🔍 Argo CD Services:"
kubectl get svc -n argocd

echo "🔐 Getting Argo CD admin initial password:"
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d; echo

echo "✅ Argo CD installation complete."
