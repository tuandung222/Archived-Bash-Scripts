# Archived Bash Scripts

A curated collection of production-tested bash scripts for DevOps, AI/ML infrastructure, and system administration tasks.

## 📂 Repository Structure

```
.
├── ai-ml-tools/              # AI/ML tools and frameworks
├── development-tools/        # Development environment setup
├── docker-container/         # Docker and container management
├── file-operations/          # File system utilities
├── gpu-cuda-nvidia/         # GPU, CUDA, and NVIDIA tools
└── network-ssh/             # Network and SSH utilities
```

## 🚀 Quick Start

1. Clone the repository:
```bash
git clone https://github.com/tuandung222/Archived-Bash-Scripts.git
cd Archived-Bash-Scripts
```

2. Make scripts executable:
```bash
find . -name "*.sh" -exec chmod +x {} \;
```

3. Run any script:
```bash
bash <category>/<script-name>.sh
```

## 📁 Categories

### 🤖 AI/ML Tools (`ai-ml-tools/`)
Scripts for machine learning and AI infrastructure:
- **DDP_pytorch-example.sh** - Distributed PyTorch training setup
- **install-anaconda-kernels.sh** - Register Conda environments as Jupyter kernels
- **setup-huggingface-env.sh** - Configure Hugging Face cache paths
- **setup-hf-transfer.sh** - Enable fast Hugging Face downloads
- **qwen72b_gpt1-int4_serving_4A100.sh** - Serve quantized LLM models
- **upload_by_huggingface_cli.sh** - Upload models to Hugging Face Hub
- **convert_jupyter_notebook_to_html.sh** - Export notebooks to HTML
- **load_multiple_parquet_file** - Load Parquet datasets

### 🛠️ Development Tools (`development-tools/`)
Essential development environment setup:
- **install-java-sdk.sh** - Install OpenJDK
- **install-jenkins.sh** - Install Jenkins CI/CD
- **install-nodejs.sh** - Install Node.js via NVM
- **install-git-lfs.sh** - Install Git Large File Storage
- **vscode_extension_install.sh** - Backup/restore VS Code extensions
- **vscode_tunnel.sh** - Start VS Code remote tunnel

### 🐳 Docker & Containers (`docker-container/`)
Container infrastructure management:
- **install-docker.sh** - Install Docker Engine
- **docker-daemon-nvidia.json** - NVIDIA runtime configuration
- **bitnet.Dockerfile** - Microsoft BitNet inference container
- **start-jenkins-container.sh** - Launch Jenkins in Docker
- **axolotl-jupyter-docker-start.sh** - Axolotl ML framework with Jupyter

### 📦 File Operations (`file-operations/`)
File system utilities:
- **archive-folder.sh** - Create compressed tar archives
- **extract-archive.sh** - Extract tar.gz files
- **view-directory-sizes.sh** - Analyze disk usage
- **process-management-examples.sh** - Process management commands

### 🎮 GPU/CUDA/NVIDIA (`gpu-cuda-nvidia/`)
GPU computing setup and management:
- **install-cuda-toolkit-12.6.sh** - Install CUDA Toolkit
- **install-nvidia-container-toolkit.sh** - Docker GPU support
- **check-free-gpu-then-exec.sh** - Wait for GPU memory threshold
- **install-flash-attention.sh** - FlashAttention v1 installation
- **install-flash-attention-2.sh** - FlashAttention v2 installation
- **NVIDIA_SETUP_GUIDE[OPTIONAL].md** - Complete NVIDIA setup guide

### 🌐 Network & SSH (`network-ssh/`)
Network utilities:
- **forward-port.sh** - Create SSH port forwarding tunnels

## 💡 Usage Examples

### Install Docker
```bash
bash docker-container/install-docker.sh
```

### Setup GPU Environment
```bash
# Install CUDA Toolkit
bash gpu-cuda-nvidia/install-cuda-toolkit-12.6.sh

# Install NVIDIA Container Toolkit
bash gpu-cuda-nvidia/install-nvidia-container-toolkit.sh
```

### Configure ML Environment
```bash
# Setup Hugging Face environment
bash ai-ml-tools/setup-huggingface-env.sh

# Enable fast downloads
bash ai-ml-tools/setup-hf-transfer.sh

# Register Conda environments as Jupyter kernels
bash ai-ml-tools/install-anaconda-kernels.sh
```

### File Operations
```bash
# Archive a directory
bash file-operations/archive-folder.sh /path/to/folder

# Extract an archive
bash file-operations/extract-archive.sh archive.tar.gz

# View directory sizes
bash file-operations/view-directory-sizes.sh /path/to/analyze
```

## ⚠️ Important Notes

- Most scripts require `sudo` privileges
- Review scripts before execution
- Some scripts modify system configuration files (with backups)
- GPU scripts require NVIDIA hardware and drivers

## 🔧 Prerequisites

- Ubuntu/Debian-based Linux distribution
- Bash 4.0 or higher
- `sudo` access for system modifications
- Internet connection for package downloads

## 📝 Script Conventions

All scripts follow these conventions:
- ✅ Include shebang (`#!/bin/bash`)
- ✅ Use `set -e` for error handling (where appropriate)
- ✅ Provide usage instructions
- ✅ Include descriptive comments
- ✅ Validate input parameters
- ✅ Display informative messages

## 🤝 Contributing

This is a personal archive of production-tested scripts. Feel free to:
- Report issues
- Suggest improvements
- Adapt scripts for your needs

## 📄 License

These scripts are provided as-is for educational and operational purposes.

## 🔗 Related Resources

- [Docker Documentation](https://docs.docker.com/)
- [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit)
- [Hugging Face Documentation](https://huggingface.co/docs)
- [PyTorch Documentation](https://pytorch.org/docs/)

---

**Author**: tuandung222  
**Repository**: https://github.com/tuandung222/Archived-Bash-Scripts
