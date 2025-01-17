#!/bin/bash

# Backup the .bashrc if it exists
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.backup
fi

# Create the cache directory if it doesn't exist
mkdir -p /dscilab_dungvo/workspace/huggingface_cache

# Update or add HF_HOME
sed -i '/^export HF_HOME=/d' ~/.bashrc
echo 'export HF_HOME=/dscilab_dungvo/workspace/huggingface_cache' >> ~/.bashrc

# # Update or add NCCL_LIBRARY
# sed -i '/^export NCCL_LIBRARY=/d' ~/.bashrc
# echo 'export NCCL_LIBRARY=/usr/lib/x86_64-linux-gnu/libnccl.so' >> ~/.bashrc

# # Update or add LD_PRELOAD
# sed -i '/^export LD_PRELOAD=/d' ~/.bashrc
# echo 'export LD_PRELOAD="/usr/local/lib/libmsamp_dist.so:\${NCCL_LIBRARY}:\${LD_PRELOAD}"' >> ~/.bashrc

# Source the .bashrc to apply changes
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi