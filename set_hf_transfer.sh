#!/bin/bash

# Install huggingface_hub with hf_transfer extra
pip install huggingface_hub[hf_transfer]
pip install hf_transfer


# Check if the line exists in .bashrc
if grep -q "export HF_HUB_ENABLE_HF_TRANSFER" ~/.bashrc; then
    # Modify the existing line
    sed -i 's/export HF_HUB_ENABLE_HF_TRANSFER=.*/export HF_HUB_ENABLE_HF_TRANSFER=1/' ~/.bashrc
else
    # Add the line if it doesn't exist
    echo "export HF_HUB_ENABLE_HF_TRANSFER=1" >> ~/.bashrc
fi

# Apply the changes to the current session
source ~/.bashrc

echo "Installation complete and environment variable set."
