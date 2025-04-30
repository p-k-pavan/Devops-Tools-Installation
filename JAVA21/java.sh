#!/bin/bash

set -e  # Exit on error

echo "🔄 Updating package list..."
sudo apt update -y

echo "📦 Installing OpenJDK 21 and fontconfig..."
sudo apt install -y fontconfig openjdk-21-jre

echo "🔍 Verifying Java version..."
java -version
