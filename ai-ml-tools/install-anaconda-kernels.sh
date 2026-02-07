#!/bin/bash
# Description: Register all Conda environments as Jupyter kernels
# Usage: bash install-anaconda-kernels.sh

set -e

# Initialize conda for bash
eval "$(conda shell.bash hook)"

echo "Discovering Conda environments..."
conda env list | awk '{print $1}' | grep -v base | grep -v '^#' | tail -n +1 > /tmp/environments.txt

echo "Installing ipykernel in each environment..."
while IFS= read -r env_name; do
    # Skip empty lines and comments
    if [[ -z "$env_name" ]] || [[ "$env_name" == \#* ]]; then
        continue
    fi
    
    echo "Processing environment: $env_name"
    
    # Activate the environment
    conda activate "$env_name"
    
    # Install ipykernel
    pip install -q ipykernel
    
    # Create a Jupyter kernel for the environment
    python -m ipykernel install --user --name "$env_name" --display-name "$env_name"
    
    # Deactivate the environment
    conda deactivate
    
    echo "  ✓ Kernel '$env_name' installed"
done < /tmp/environments.txt

# Cleanup
rm /tmp/environments.txt

echo ""
echo "All Conda environments registered as Jupyter kernels!"
echo "View available kernels with: jupyter kernelspec list"
