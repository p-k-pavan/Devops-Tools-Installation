#!/bin/bash

set -e  # Exit on error

# Prompt user for inputs
read -p "Enter your EKS cluster name: " CLUSTER_NAME
read -p "Enter the AWS region (e.g., us-east-2): " REGION
read -p "Enter your SSH key name (must already exist in EC2): " SSH_KEY_NAME

echo "🚀 Creating EKS cluster: $CLUSTER_NAME in region $REGION..."
eksctl create cluster \
  --name="$CLUSTER_NAME" \
  --region="$REGION" \
  --version=1.30 \
  --without-nodegroup

echo "🔐 Associating IAM OIDC provider..."
eksctl utils associate-iam-oidc-provider \
  --region="$REGION" \
  --cluster="$CLUSTER_NAME" \
  --approve

echo "🧱 Creating managed node group..."
eksctl create nodegroup \
  --cluster="$CLUSTER_NAME" \
  --region="$REGION" \
  --name="$CLUSTER_NAME-nodegroup" \
  --node-type=t2.large \
  --nodes=2 \
  --nodes-min=2 \
  --nodes-max=2 \
  --node-volume-size=29 \
  --ssh-access \
  --ssh-public-key="$SSH_KEY_NAME"

echo "✅ EKS cluster and node group setup complete!"
