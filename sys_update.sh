#!/bin/bash

read -p "Enter the service name that you want to update: " service_name
echo "Starting system update for $service_name..."
sudo yum update "$service_name" -y
