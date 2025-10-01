# NVIDIA Container Toolkit Setup Guide

This guide walks you through installing and configuring the NVIDIA Container Toolkit to run GPU-accelerated Docker containers.

## Prerequisites

- Ubuntu 18.04+ or similar Linux distribution
- NVIDIA GPU with driver version 470.42.01+
- Docker Engine installed
- Root or sudo access

## Step 1: Verify NVIDIA Driver Installation

First, check if NVIDIA drivers are properly installed:

```bash
# Check NVIDIA driver version and GPU status
nvidia-smi

# Expected output should show your GPU(s) and driver version
# Example:
# +-----------------------------------------------------------------------------+
# | NVIDIA-SMI 545.29.06              Driver Version: 545.29.06    CUDA Version: 12.3 |
# +-------------------------------+----------------------+----------------------+
# | GPU  Name                 TCC/WDDM | Bus-Id        Disp.A | Volatile Uncorr. ECC |
# | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
# +-------------------------------+----------------------+----------------------+
# |   0  NVIDIA H100 80GB HBM3     On   | 00000000:01:00.0 Off |                    0 |
```

If `nvidia-smi` command not found, install NVIDIA drivers first:

```bash
# Update package list
sudo apt update

# Install NVIDIA drivers (choose appropriate version)
sudo apt install nvidia-driver-545

# Reboot system
sudo reboot

# Verify installation after reboot
nvidia-smi
```

## Step 2: Install NVIDIA Container Toolkit

### Method 1: APT Repository (Recommended)

```bash
# Configure the production repository
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Update package list
sudo apt-get update

# Install NVIDIA Container Toolkit
sudo apt-get install -y nvidia-container-toolkit
```

### Method 2: Manual Installation (Alternative)

```bash
# Download and install the package directly
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
```

## Step 3: Configure Docker for NVIDIA Runtime

### Configure the Docker daemon

```bash
# Configure the container runtime
sudo nvidia-ctk runtime configure --runtime=docker

# Alternative manual configuration (if above doesn't work)
sudo tee /etc/docker/daemon.json > /dev/null <<EOF
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
```

### Restart Docker service

```bash
# Restart Docker to apply changes
sudo systemctl restart docker

# Verify Docker is running
sudo systemctl status docker
```

## Step 4: Verify NVIDIA Container Runtime

Test the installation with a simple container:

```bash
# Test NVIDIA runtime with a simple container
sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:12.0-base-ubuntu20.04 nvidia-smi

# Alternative test with automatic GPU detection
sudo docker run --rm --gpus all nvidia/cuda:12.0-base-ubuntu20.04 nvidia-smi

# Expected output should show your GPU information within the container
```

## Step 5: Configure GPU Access for Your User

Add your user to the docker group to run Docker without sudo:

```bash
# Add current user to docker group
sudo usermod -aG docker $USER

# Apply group changes (logout/login or run):
newgrp docker

# Test Docker without sudo
docker run --rm --gpus all nvidia/cuda:12.0-base-ubuntu20.04 nvidia-smi
```

## Step 6: Advanced GPU Configuration

### Limit GPU Access for Containers

You can control which GPUs a container can access using several methods:

#### Method 1: Environment Variables in Docker Compose

```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1  # Only GPUs 0 and 1 visible
  - NVIDIA_VISIBLE_DEVICES=0,1  # NVIDIA runtime equivalent
```

#### Method 2: Docker Run Command

```bash
# Specify specific GPUs
docker run --gpus '"device=0,1"' your-image

# Limit by GPU count
docker run --gpus 2 your-image

# All GPUs
docker run --gpus all your-image
```

### Memory Management

Configure VRAM usage within your application using environment variables:

```yaml
environment:
  - GPU_MEMORY_UTILIZATION=0.4  # Use only 40% of available VRAM
  - CUDA_MEMORY_FRACTION=0.4    # Alternative for some applications
```

## Step 7: Troubleshooting

### Common Issues and Solutions

#### Issue: "could not select device driver nvidia with capabilities: [[gpu]]"

**Solution:**

```bash
# Check if nvidia-container-runtime is installed
nvidia-container-runtime --version

# Restart Docker daemon
sudo systemctl restart docker

# Check Docker daemon configuration
sudo cat /etc/docker/daemon.json
```

#### Issue: "nvidia-smi not found in container"

**Solution:**

```bash
# Ensure you're using nvidia runtime
docker run --runtime=nvidia --gpus all your-image

# Or specify in docker-compose.yml
runtime: nvidia
```

#### Issue: "Failed to initialize NVML"

**Solution:**

```bash
# Check host NVIDIA drivers
nvidia-smi

# Update NVIDIA drivers
sudo apt update && sudo apt upgrade nvidia-driver-*

# Reboot system
sudo reboot
```

#### Issue: Permission denied for Docker

**Solution:**

```bash
# Add user to docker group
sudo usermod -aG docker $USER

# Restart session or run:
newgrp docker
```

### Verification Commands

```bash
# Check NVIDIA Container Toolkit installation
nvidia-ctk --version

# Check Docker daemon configuration
sudo docker info | grep -i runtime

# Test GPU access in container
docker run --rm --gpus all nvidia/cuda:12.0-base-ubuntu20.04 nvidia-smi

# Check available GPU devices
ls -la /dev/nvidia*
```

## Step 8: Running Your vLLM Container

After completing the setup, you can run your vLLM service:

```bash
# Navigate to your project directory
cd /home/dung.vpt/workspace/company_repositories/temp-ai-models/serving/vllm_qwen_25_instuct_awq/

# Build and run with GPU support
docker compose -f Docker-compose.yaml up --build

# Monitor GPU usage while container is running (in another terminal)
watch -n 1 nvidia-smi
```

## GPU Configuration Examples

### Single GPU Configuration

```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0
  - GPU_MEMORY_UTILIZATION=0.8
  - TENSOR_PARALLEL_SIZE=1
```

### Multi-GPU Configuration

```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1,2,3
  - GPU_MEMORY_UTILIZATION=0.9
  - TENSOR_PARALLEL_SIZE=4
```

### Memory-Limited Configuration

```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0
  - GPU_MEMORY_UTILIZATION=0.3  # Use only 30% of VRAM
  - TENSOR_PARALLEL_SIZE=1
```

## Monitoring and Management

### Monitor GPU Usage

```bash
# Real-time GPU monitoring
nvidia-smi -l 1

# Monitor with more details
nvidia-smi dmon

# Check GPU processes
nvidia-smi pmon
```

### Container-specific GPU monitoring

```bash
# Monitor GPU usage from within container
docker exec -it your-container nvidia-smi

# Check GPU memory usage
docker exec -it your-container nvidia-smi --query-gpu=memory.used,memory.total --format=csv
```

---

## Summary

After completing this setup:

1. ✅ NVIDIA drivers are installed and working
2. ✅ NVIDIA Container Toolkit is configured
3. ✅ Docker has NVIDIA runtime support
4. ✅ GPU access is properly configured for containers
5. ✅ VRAM usage can be controlled via environment variables
6. ✅ Multiple GPU support is available

Your Docker Compose setup will now be able to:

- Access specified GPUs (via `CUDA_VISIBLE_DEVICES`)
- Limit VRAM usage (via `GPU_MEMORY_UTILIZATION`)
- Scale across multiple GPUs (via `TENSOR_PARALLEL_SIZE`)

For support, refer to:

- [NVIDIA Container Toolkit Documentation](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- [Docker GPU Support](https://docs.docker.com/config/containers/resource_constraints/#gpu)

## GPU Configuration Examples

This file contains various GPU configuration examples for different use cases.

## Docker Compose GPU Configurations

### Example 1: Single GPU with Memory Limit
```yaml
# Use only GPU 0 with 40% VRAM
services:
  vllm-server:
    environment:
      - CUDA_VISIBLE_DEVICES=0
      - GPU_MEMORY_UTILIZATION=0.4
      - TENSOR_PARALLEL_SIZE=1
    runtime: nvidia
```

### Example 2: Multi-GPU Setup
```yaml
# Use GPUs 0,1,2,3 with high memory utilization
services:
  vllm-server:
    environment:
      - CUDA_VISIBLE_DEVICES=0,1,2,3
      - GPU_MEMORY_UTILIZATION=0.9
      - TENSOR_PARALLEL_SIZE=4
    runtime: nvidia
```

### Example 3: Memory-Constrained Environment
```yaml
# Conservative memory usage for shared GPU environments
services:
  vllm-server:
    environment:
      - CUDA_VISIBLE_DEVICES=0
      - GPU_MEMORY_UTILIZATION=0.2  # Only 20% VRAM
      - TENSOR_PARALLEL_SIZE=1
      - MAX_MODEL_LEN=2048  # Reduced context length
    runtime: nvidia
```

### Example 4: Development Environment
```yaml
# Development setup with specific GPU and debugging
services:
  vllm-server:
    environment:
      - CUDA_VISIBLE_DEVICES=1  # Use second GPU
      - GPU_MEMORY_UTILIZATION=0.5
      - TENSOR_PARALLEL_SIZE=1
      - VLLM_LOGGING_LEVEL=DEBUG
    runtime: nvidia
```

## Docker Run Command Examples

### Single GPU with specific device
```bash
docker run --gpus '"device=0"' \
  -e CUDA_VISIBLE_DEVICES=0 \
  -e GPU_MEMORY_UTILIZATION=0.4 \
  your-vllm-image
```

### Multiple GPUs
```bash
docker run --gpus '"device=0,1"' \
  -e CUDA_VISIBLE_DEVICES=0,1 \
  -e GPU_MEMORY_UTILIZATION=0.8 \
  -e TENSOR_PARALLEL_SIZE=2 \
  your-vllm-image
```

### All available GPUs
```bash
docker run --gpus all \
  -e GPU_MEMORY_UTILIZATION=0.9 \
  your-vllm-image
```

## Environment Variable Reference

| Variable | Description | Example Values | Default |
|----------|-------------|----------------|---------|
| `CUDA_VISIBLE_DEVICES` | Which GPUs are visible to the application | `0`, `0,1`, `0,1,2,3` | `0` |
| `NVIDIA_VISIBLE_DEVICES` | NVIDIA runtime GPU selection | `0`, `0,1`, `all` | `all` |
| `GPU_MEMORY_UTILIZATION` | Fraction of GPU memory to use | `0.1` to `1.0` | `0.9` |
| `TENSOR_PARALLEL_SIZE` | Number of GPUs for tensor parallelism | `1`, `2`, `4`, `8` | `1` |
| `NVIDIA_DRIVER_CAPABILITIES` | Driver capabilities to expose | `compute,utility` | `compute,utility` |

## GPU Memory Management Strategies

### Strategy 1: Conservative (Shared Environment)
```yaml
environment:
  - GPU_MEMORY_UTILIZATION=0.3  # 30% of VRAM
  - MAX_MODEL_LEN=2048
  - ENABLE_CHUNKED_PREFILL=true
```

### Strategy 2: Aggressive (Dedicated Environment)
```yaml
environment:
  - GPU_MEMORY_UTILIZATION=0.95  # 95% of VRAM
  - MAX_MODEL_LEN=8192
  - ENABLE_CHUNKED_PREFILL=false
```

### Strategy 3: Balanced (Production)
```yaml
environment:
  - GPU_MEMORY_UTILIZATION=0.7   # 70% of VRAM
  - MAX_MODEL_LEN=4096
  - ENABLE_CHUNKED_PREFILL=true
```

## Multi-GPU Configurations

### 2 GPU Setup (H100 80GB each)
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1
  - GPU_MEMORY_UTILIZATION=0.8
  - TENSOR_PARALLEL_SIZE=2
  - MAX_MODEL_LEN=8192
```

### 4 GPU Setup (for large models)
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1,2,3
  - GPU_MEMORY_UTILIZATION=0.9
  - TENSOR_PARALLEL_SIZE=4
  - MAX_MODEL_LEN=16384
```

### 8 GPU Setup (enterprise scale)
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
  - GPU_MEMORY_UTILIZATION=0.95
  - TENSOR_PARALLEL_SIZE=8
  - MAX_MODEL_LEN=32768
```

## Troubleshooting GPU Issues

### Check GPU availability in container
```bash
docker exec -it your-container nvidia-smi
```

### Monitor GPU memory usage
```bash
# Real-time monitoring
nvidia-smi -l 1

# Memory-specific monitoring
nvidia-smi --query-gpu=memory.used,memory.total --format=csv -l 1
```

### Debug GPU visibility
```bash
# Check which GPUs are visible
docker exec -it your-container python -c "
import torch
print(f'CUDA available: {torch.cuda.is_available()}')
print(f'GPU count: {torch.cuda.device_count()}')
for i in range(torch.cuda.device_count()):
    print(f'GPU {i}: {torch.cuda.get_device_name(i)}')
"
```

## Performance Optimization Tips

### For Single Large Model
- Use all available GPUs with tensor parallelism
- Set high memory utilization (0.8-0.9)
- Increase max model length if needed

### For Multiple Small Models
- Use single GPU per model instance
- Lower memory utilization per instance
- Run multiple containers with different GPU assignments

### For Development/Testing
- Use lower memory utilization (0.3-0.5)
- Single GPU setup
- Enable debug logging

## Common Configurations by Use Case

### Production Serving
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1
  - GPU_MEMORY_UTILIZATION=0.8
  - TENSOR_PARALLEL_SIZE=2
  - MAX_MODEL_LEN=4096
  - DISABLE_LOG_REQUESTS=true
```

### Research/Development
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0
  - GPU_MEMORY_UTILIZATION=0.5
  - TENSOR_PARALLEL_SIZE=1
  - MAX_MODEL_LEN=2048
  - VLLM_LOGGING_LEVEL=DEBUG
```

### Batch Processing
```yaml
environment:
  - CUDA_VISIBLE_DEVICES=0,1,2,3
  - GPU_MEMORY_UTILIZATION=0.95
  - TENSOR_PARALLEL_SIZE=4
  - MAX_MODEL_LEN=8192
```
