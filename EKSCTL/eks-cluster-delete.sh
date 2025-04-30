#!/bin/bash

# Ask for cluster name and region
echo ""
read -p "Enter the name of the cluster you want to delete: " CLUSTER_NAME
read -p "Enter the AWS region of the cluster: " REGION

echo "⚠️ You are about to delete EKS cluster '$CLUSTER_NAME' in region '$REGION'."
read -p "Are you sure? (yes/no): " CONFIRM

if [[ "$CONFIRM" == "yes" ]]; then
  eksctl delete cluster --name "$CLUSTER_NAME" --region "$REGION"
  echo "✅ Cluster '$CLUSTER_NAME' has been deleted."
else
  echo "❌ Cluster deletion cancelled."
fi
