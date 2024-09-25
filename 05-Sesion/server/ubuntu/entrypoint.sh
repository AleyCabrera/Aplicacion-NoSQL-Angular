#!/bin/bash

# Check if ROOT_PASSWORD is set
if [ -z "$ROOT_PASSWORD" ]; then
    echo "Error: ROOT_PASSWORD is not set!"
    exit 1
fi

# Set root password
echo "root:$ROOT_PASSWORD" | chpasswd

# Start the SSH service
/usr/sbin/sshd -D

# Continue with the original command (if any)
exec "$@"