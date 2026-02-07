# Archived Bash Scripts Overview

This repository contains a curated collection of production-tested bash scripts organized by category. Each script has been refactored for better maintainability with proper error handling, documentation, and consistent formatting.

## 📂 Repository Structure

The repository is organized into the following categories:

### 🤖 ai-ml-tools/
AI and Machine Learning infrastructure scripts
- `DDP_pytorch-example.sh` - PyTorch distributed training with torchrun
- `install-anaconda-kernels.sh` - Register Conda environments as Jupyter kernels
- `setup-huggingface-env.sh` - Configure Hugging Face cache and environment
- `setup-hf-transfer.sh` - Enable fast HF Hub downloads
- `qwen72b_gpt1-int4_serving_4A100.sh` - Serve quantized LLM with vLLM
- `upload_by_huggingface_cli.sh` - HF Hub upload templates
- `convert_jupyter_notebook_to_html.sh` - Export notebooks to HTML
- `load_multiple_parquet_file` - Python snippet for loading Parquet datasets

### 🛠️ development-tools/
Development environment setup scripts
- `install-java-sdk.sh` - Install OpenJDK with version selection
- `install-jenkins.sh` - Install Jenkins CI/CD server
- `install-nodejs.sh` - Install Node.js 22 via NVM
- `install-git-lfs.sh` - Install and configure Git LFS
- `vscode_extension_install.sh` - Backup and restore VS Code extensions
- `vscode_tunnel.sh` - Start VS Code remote tunnel

### 🐳 docker-container/
Docker and container management scripts
- `install-docker.sh` - Install Docker Engine with proper configuration
- `docker-daemon-nvidia.json` - NVIDIA runtime configuration template
- `bitnet.Dockerfile` - Microsoft BitNet inference container
- `start-jenkins-container.sh` - Launch Jenkins in Docker
- `axolotl-jupyter-docker-start.sh` - Axolotl ML framework with JupyterLab

### 📦 file-operations/
File system utilities and process management
- `archive-folder.sh` - Create compressed tar archives
- `extract-archive.sh` - Extract tar.gz files
- `view-directory-sizes.sh` - Analyze disk usage by directory
- `process-management-examples.sh` - Process termination examples

### 🎮 gpu-cuda-nvidia/
GPU computing setup and management
- `install-cuda-toolkit-12.6.sh` - Install CUDA Toolkit 12.6
- `install-nvidia-container-toolkit.sh` - Docker GPU support
- `check-free-gpu-then-exec.sh` - Wait for GPU memory threshold
- `install-flash-attention.sh` - FlashAttention v1 installation
- `install-flash-attention-2.sh` - FlashAttention v2 from source
- `NVIDIA_SETUP_GUIDE[OPTIONAL].md` - Complete NVIDIA setup guide

### 🌐 network-ssh/
Network utilities and SSH tunneling
- `forward-port.sh` - Create SSH port forwarding tunnels

## 📖 Documentation

Each category directory contains a detailed README.md with:
- Script descriptions and usage examples
- Common workflows
- Troubleshooting guides
- Best practices

See the main [README.md](README.md) for complete documentation.

## ✨ Improvements

All scripts have been refactored to include:
- Proper shebang (`#!/bin/bash`)
- Error handling with `set -e` where appropriate
- Input validation and helpful usage messages
- Descriptive comments and documentation
- Consistent naming conventions
- Executable permissions
