#!/bin/bash

set -e  # Exit if any command fails

echo "🐳 Pulling latest official Sonatype Nexus 3 image..."
docker pull sonatype/nexus3

echo "🚀 Starting Nexus 3 container on port 8081..."
docker run -d \
  --name nexus \
  -p 8081:8081 \
  -v nexus-data:/nexus-data \
  sonatype/nexus3

echo "✅ Nexus 3 is now running at http://<your-server-ip>:8081"
