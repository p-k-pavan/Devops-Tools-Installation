#!/bin/bash

# Update package list
sudo apt update

# Install software-properties-common for add-apt-repository
sudo apt install -y software-properties-common

# Add the Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Confirm installation
ansible --version
