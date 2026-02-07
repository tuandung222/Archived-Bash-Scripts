#!/bin/bash
# Description: Wait for GPU memory threshold to be met, then execute a script
# Usage: bash check-free-gpu-then-exec.sh [script_path] [threshold_gb]

set -e

# Configuration
GPU_FREE_MEMORY_THRESHOLD="${2:-32}"  # GB (default: 32)
BASH_FILE_PATH="${1:-run.sh}"
CHECK_INTERVAL=5  # seconds

# Ensure bc is installed
if ! command -v bc &> /dev/null; then
    echo "Installing bc for calculations..."
    sudo apt install -y bc
fi

echo "Monitoring GPU 0 for at least ${GPU_FREE_MEMORY_THRESHOLD}GB free memory..."
echo "Will execute: ${BASH_FILE_PATH}"
echo ""

while true; do
    # Get the free memory of GPU 0 in MiB
    free_memory=$(nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits -i 0)
    
    # Convert MiB to GiB
    free_memory_gb=$(echo "scale=2; $free_memory / 1024" | bc)
    
    # Check if free memory is greater than threshold
    if (( $(echo "$free_memory_gb > $GPU_FREE_MEMORY_THRESHOLD" | bc -l) )); then
        echo "GPU 0 Free Memory: ${free_memory_gb}GB - Threshold met!"
        echo "Executing ${BASH_FILE_PATH}..."
        bash "$BASH_FILE_PATH"
        break
    else
        echo "GPU 0 Free Memory: ${free_memory_gb}GB - Waiting..."
    fi
    
    sleep "$CHECK_INTERVAL"
done
