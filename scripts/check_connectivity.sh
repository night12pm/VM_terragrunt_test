#!/bin/bash

# Define variables
VM_PUBLIC_IPS=$1
SSH_USER="ubuntu"
SSH_KEY="~/.ssh/id_rsa"

# Check if VM public IPs are provided
if [ -z "$VM_PUBLIC_IPS" ]; then
  echo "Error: No public IP addresses provided."
  echo "Usage: ./check_connectivity.sh 'IP1 IP2 IP3'"
  exit 1
fi

# Loop through the list of IPs and check connectivity
for IP in $VM_PUBLIC_IPS; do
  echo "Checking SSH connectivity for $IP..."
  ssh -i $SSH_KEY -o StrictHostKeyChecking=no $SSH_USER@$IP "echo 'SSH connection successful to $IP'"
  if [ $? -ne 0 ]; then
    echo "Error: Failed to connect to $IP"
  else
    echo "Success: Connected to $IP"
  fi
done
