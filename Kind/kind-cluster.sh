#!/bin/bash

# Title: Create Kind Cluster
# Description: Creates a multi-node Kubernetes cluster using Kind

set -e

cat <<EOF > kind-cluster.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4

nodes:
  - role: control-plane
    image: kindest/node:v1.31.2
  - role: worker
    image: kindest/node:v1.31.2
  - role: worker
    image: kindest/node:v1.31.2
EOF

echo "📦 Creating Kind cluster named 'my-cluster'..."
kind create cluster --name my-cluster --config kind-cluster.yaml

echo "✅ Cluster created! Run 'kubectl get nodes' to verify."
