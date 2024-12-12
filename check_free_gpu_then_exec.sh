#!/bin/bash

# Description: Check if the GPU with ID 0 have enough GPU for runing a bash script.

apt install -y bc
GPU_FREE_MEMORY_THRESHOLD=32 # GB
BASH_FILE_PATH="run.sh"
while true; do
  # Get the free memory of GPU 0 in MiB
  free_memory=$(nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits -i 0 | awk '{print $1}')
  
  # Convert MiB to GiB
  free_memory_gb=$(echo "scale=2; $free_memory / 1024" | bc)
  
  # Check if free memory is greater than 32 GiB
  if (( $(echo "$free_memory_gb > $GPU_FREE_MEMORY_THRESHOLD" | bc -l) )); then
    bash $BASH_FILE_PATH
    break
  else
    echo "GPU 0 Free Memory: ${free_memory_gb}GiB"
  fi
  
  # Wait for 5 seconds before checking again
  sleep 5
done
