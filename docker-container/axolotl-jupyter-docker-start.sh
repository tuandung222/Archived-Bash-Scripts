#!/bin/bash
# Description: Run Axolotl ML framework with JupyterLab in Docker
# Usage: bash axolotl-jupyter-docker-start.sh
# Requirements: NVIDIA GPU, nvidia-docker runtime
# Access: http://localhost:10000

set -e

echo "Starting Axolotl with JupyterLab..."

docker run -d --rm --gpus all \
    --name jax-lab \
    --hostname jax-lab \
    --mount type=tmpfs,destination=/dev/shm,tmpfs-size=0,tmpfs-mode=1777 \
    -p 10000:8888 \
    -v /home/dungvpt:/home/dungvpt \
    -v /home/dungvpt/.cache:/root/.cache \
    -w /home/dungvpt \
    axolotlai/axolotl:main-py3.11-cu126-2.7.1  \
    bash -lc "
        pip install --upgrade pip &&
	pip install -U packaging setuptools wheel ninja torchao&&
	pip install --no-build-isolation axolotl[flash-attn,deepspeed,vllm] &&
        pip install jupyterlab ipywidgets  &&
        jupyter lab \
            --ip=0.0.0.0 \
            --port=8888 \
            --no-browser \
            --allow-root \
            --NotebookApp.token='' \
            --NotebookApp.password='' \
            --NotebookApp.notebook_dir=/home/dungvpt 
    "

echo "JupyterLab started!"
echo "Access at: http://localhost:10000"

# Alternative command for specific GPUs:
# docker run -d --rm --gpus '"device=1,2"' \
#     --name jax-lab \
#     --hostname jax-lab \
#     --mount type=tmpfs,destination=/dev/shm,tmpfs-size=0,tmpfs-mode=1777 \
#     -p 10000:8888 \
#     -v /home/dungvpt:/home/dungvpt \
#     -v /home/dungvpt/.cache:/root/.cache \
#     -w /home/dungvpt \
#     -e CUDA_VISIBLE_DEVICES=0,1 \
#     axolotlai/axolotl:main-py3.11-cu126-2.7.1  \
#     bash -lc "
#         pip install --upgrade pip &&
#         pip install -U packaging setuptools wheel ninja torchao &&
#         pip install --no-build-isolation 'axolotl[flash-attn,deepspeed,vllm]' &&
#         pip install jupyterlab ipywidgets &&
#         jupyter lab \
#             --ip=0.0.0.0 \
#             --port=8888 \
#             --no-browser \
#             --allow-root \
#             --NotebookApp.token='' \
#             --NotebookApp.password='' \
#             --NotebookApp.notebook_dir=/home/dungvpt
#     "
