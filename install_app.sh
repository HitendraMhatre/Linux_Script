#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

username="$1"

echo "Installing/updating applications for user: $username"

# Function to check if a package is installed
is_package_installed() {
    dpkg -l "$1" &> /dev/null
}

# Install or update OpenSSH
if is_package_installed openssh-server; then
    echo "OpenSSH is already installed."
else
    sudo apt-get update
    sudo apt-get install -y openssh-server
fi

# Install or update net-tools
if is_package_installed net-tools; then
    echo "net-tools is already installed."
else
    sudo apt-get install -y net-tools
fi

# Install or update docker
if is_package_installed docker.io; then
    echo "Docker is already installed."
else
    sudo apt-get update
    sudo apt-get install -y docker.io
fi

echo "Applications installed/updated successfully for user: $username"

