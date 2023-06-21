#!/bin/bash

# Update the package index and install dependencies
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add the Docker GPG key to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
sudo apt-get update -y

# Install Docker Engine and containerd
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Verify that Docker is installed correctly
sudo docker run hello-world