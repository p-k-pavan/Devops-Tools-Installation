#!/bin/bash

set -e

read -p "Enter the name of the Kind cluster to delete: " CLUSTER_NAME

if [ -z "$CLUSTER_NAME" ]; then
  echo "❌ Cluster name cannot be empty!"
  exit 1
fi

echo "🗑️ Deleting Kind cluster '$CLUSTER_NAME'..."
kind delete cluster --name "$CLUSTER_NAME"
echo "✅ Cluster '$CLUSTER_NAME' deleted."
