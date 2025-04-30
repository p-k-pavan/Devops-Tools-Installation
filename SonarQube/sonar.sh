#!/bin/bash

set -e  # Exit if any command fails

echo "🐳 Pulling latest SonarQube LTS Community image..."
docker pull sonarqube:lts-community

echo "🚀 Starting SonarQube container on port 9000..."
docker run -dit \
  --name sonarqube \
  -p 9000:9000 \
  sonarqube:lts-community

echo "✅ SonarQube is now running at http://<your-server-ip>:9000"
