#!/bin/bash

OS_TYPE="$1"

if [ -z "$OS_TYPE" ]; then
    if command -v yum &>/dev/null; then
        OS_TYPE="yum"
    elif command -v apt &>/dev/null; then
        OS_TYPE="apt"
    else
        echo "No supoorted package manager found (yum/apt)."
        exit 1
    fi
fi

echo "Using package manager: $OS_TYPE"

if [ "$OS_TYPE" == "yum" ]; then
    echo "Checking for updates..."
    sudo yum check-update
    echo "Installing updates..."
    sudo yum -y update
elif [ "$OS_TYPE" == "apt" ]; then
    echo "Updating package lists..."
    sudo apt update
    echo "Installing updates..."
    suod apt -y upgrade
else
    echo "Unsupported package manager: $OS_TYPE"
    exit 1
fi

echo "System is up-to-update."
