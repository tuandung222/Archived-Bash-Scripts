#!/bin/bash
# Description: Template commands for uploading to Hugging Face Hub
# Usage: Edit this file and uncomment/modify the desired template

# Upload file or folder
# Template 1: Upload a folder to a model repository
# huggingface-cli upload \
# tuandunghcmut/TDung_Legacy_0 \
# /dscilab_dungvo/workspace/TDung \
# --repo-type model \
# --private

# Template 2: Upload a large folder
# huggingface-cli upload-large-folder \
# tuandunghcmut/paper_clones_2 \
# ./ \
# --repo-type model \
# --private

# Template 3: Upload file with specific destination
# huggingface-cli upload <your-username>/<repo-name> <local-folder-path> <destination-path-in-repo> --repo-type <type>
# huggingface-cli upload tuandunghcmut/vscode_dev vscode_dev.zip --repo-type model

echo "This is a template file. Edit and uncomment the commands you want to use."
