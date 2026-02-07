# GPU, CUDA & NVIDIA Tools

Scripts for setting up and managing NVIDIA GPU computing environments.

## Scripts

### install-cuda-toolkit-12.6.sh
**Description**: Install CUDA Toolkit 12.6 on Ubuntu  
**Usage**: `bash install-cuda-toolkit-12.6.sh`  
**Post-install**: Add to ~/.bashrc:
```bash
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
```
**Verify**: `nvcc --version`

### install-nvidia-container-toolkit.sh
**Description**: Install NVIDIA Container Toolkit for Docker GPU support  
**Usage**: `bash install-nvidia-container-toolkit.sh`  
**Requirements**: Docker must be installed first  
**Test**: `docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu22.04 nvidia-smi`

### check-free-gpu-then-exec.sh
**Description**: Wait for GPU memory threshold to be met, then execute a script  
**Usage**: `bash check-free-gpu-then-exec.sh [script_path] [threshold_gb]`  
**Example**: `bash check-free-gpu-then-exec.sh train.sh 32`  
**Default**: run.sh with 32GB threshold  
**Use case**: Queue GPU jobs when resources become available

### install-flash-attention.sh
**Description**: Install FlashAttention v1 from PyPI  
**Usage**: `bash install-flash-attention.sh`  
**Requirements**: CUDA-compatible GPU, PyTorch installed  
**Dependencies**: ninja, packaging

### install-flash-attention-2.sh
**Description**: Install FlashAttention v2 from source using uv  
**Usage**: `bash install-flash-attention-2.sh`  
**Requirements**: CUDA-compatible GPU, uv package manager  
**Note**: Builds from source for optimal performance

### NVIDIA_SETUP_GUIDE[OPTIONAL].md
**Description**: Comprehensive guide for NVIDIA software setup  
**Content**: Step-by-step instructions for driver and toolkit installation

## Common Workflows

### Initial GPU Setup
```bash
# 1. Install NVIDIA drivers (see NVIDIA_SETUP_GUIDE[OPTIONAL].md)

# 2. Install CUDA Toolkit
bash install-cuda-toolkit-12.6.sh

# 3. Update environment variables
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# 4. Verify installation
nvidia-smi
nvcc --version
```

### Docker GPU Support
```bash
# 1. Install Docker first (see docker-container/ directory)

# 2. Install NVIDIA Container Toolkit
bash install-nvidia-container-toolkit.sh

# 3. Test GPU access in Docker
docker run --rm --gpus all nvidia/cuda:12.0.0-base-ubuntu22.04 nvidia-smi
```

### Deep Learning Setup
```bash
# 1. Install PyTorch with CUDA support
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# 2. Install FlashAttention v2
bash install-flash-attention-2.sh

# 3. Verify GPU access
python -c "import torch; print(torch.cuda.is_available())"
```

### Queue GPU Jobs
```bash
# Wait for 40GB free on GPU 0, then run training
bash check-free-gpu-then-exec.sh train.sh 40
```

## Troubleshooting

### Check GPU Status
```bash
# View GPU utilization
nvidia-smi

# Monitor GPU every 2 seconds
watch -n 2 nvidia-smi

# Check CUDA version
nvcc --version
```

### Common Issues

**Issue**: `nvidia-smi` not found  
**Solution**: Install/update NVIDIA drivers

**Issue**: CUDA version mismatch  
**Solution**: Ensure PyTorch CUDA version matches system CUDA

**Issue**: Docker can't access GPU  
**Solution**: Install nvidia-container-toolkit and restart Docker

**Issue**: Out of memory errors  
**Solution**: Reduce batch size or use gradient accumulation

## Version Compatibility

| CUDA | PyTorch | Python |
|------|---------|--------|
| 12.6 | 2.x     | 3.10+  |
| 12.1 | 2.x     | 3.8+   |
| 11.8 | 2.x     | 3.8+   |

## Resources

- [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/)
- [PyTorch Installation](https://pytorch.org/get-started/locally/)
- [FlashAttention](https://github.com/Dao-AILab/flash-attention)
