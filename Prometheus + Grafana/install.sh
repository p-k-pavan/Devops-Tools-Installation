#!/bin/bash

# Add Helm repositories
helm repo add stable https://charts.helm.sh/stable
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create namespace
kubectl create namespace prometheus

# Install Prometheus & Grafana stack
helm install prometheus-stack prometheus-community/kube-prometheus-stack -n prometheus

# Wait for pods to be ready
echo "⏳ Waiting for Prometheus stack pods to be ready..."
kubectl wait --namespace prometheus \
  --for=condition=Ready pods \
  --all \
  --timeout=180s

# Patch Prometheus service to NodePort
echo "🌐 Exposing Prometheus via NodePort..."
kubectl patch svc prometheus-stack-kube-prometheus-prometheus \
  -n prometheus \
  -p '{"spec": {"type": "NodePort"}}'

# Patch Grafana service to NodePort
echo "🌐 Exposing Grafana via NodePort..."
kubectl patch svc prometheus-stack-grafana \
  -n prometheus \
  -p '{"spec": {"type": "NodePort"}}'

# Output services
echo "🔍 Current services in 'prometheus' namespace:"
kubectl get svc -n prometheus

# Get Grafana password
echo "🔐 Grafana admin password:"
kubectl get secret --namespace prometheus prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

echo "✅ Setup complete. Access Prometheus and Grafana via NodePort."
