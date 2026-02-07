#!/bin/bash

eval "$(conda shell.bash hook)"


# Get a list of all conda environments
conda env list | awk '{print $1}' | grep -v base | tail -n +1> environments.txt
# Loop through each environment
while IFS= read -r env_name; do
  # Skip lines starting with '#'
  if [[ $env_name == \#* ]]; then
    continue
  fi

  # Activate the environment
  conda init
  conda activate "$env_name"

  # Install ipykernel
  # conda install -c conda-forge ipykernel
  pip install ipykernel

  # Create a Jupyter kernel for the environment
  python -m ipykernel install --user --name "$env_name" --display-name "$env_name"

  # Deactivate the environment
  conda deactivate
done < environments.txt

# Remove the temporary file
rm environments.txt

