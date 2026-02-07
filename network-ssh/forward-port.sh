#!/bin/bash
# Description: Create SSH port forwarding tunnel
# Usage: bash forward-port.sh <user@host> <remote_port> <local_port> [ssh_port]
# Example: bash forward-port.sh user@example.com 10000 10000 22

set -e

if [ $# -lt 3 ]; then
    echo "Usage: $0 <user@host> <remote_port> <local_port> [ssh_port]"
    echo "Example: $0 user@server.com 10000 10000 22"
    exit 1
fi

USER_HOST="$1"
REMOTE_PORT="$2"
LOCAL_PORT="$3"
SSH_PORT="${4:-22}"

echo "Creating SSH tunnel..."
echo "  Local: localhost:${LOCAL_PORT}"
echo "  Remote: ${USER_HOST}:${REMOTE_PORT}"
echo "  SSH Port: ${SSH_PORT}"
echo ""

ssh -p "$SSH_PORT" -N -f -L "${LOCAL_PORT}:127.0.0.1:${REMOTE_PORT}" "$USER_HOST"

echo "Tunnel established!"
echo "Access via: http://localhost:${LOCAL_PORT}"
