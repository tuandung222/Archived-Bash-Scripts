#!/bin/bash
# Description: Serve Qwen2-VL-72B-Instruct-GPTQ-Int4 model with vLLM
# Requirements: 160GB RAM across 4 GPUs, vLLM installed in conda environment
# Usage: bash qwen72b_gpt1-int4_serving_4A100.sh

set -e

echo "Activating vllm conda environment..."
eval "$(conda shell.bash hook)"
conda activate vllm

echo "Starting Qwen2-VL-72B model server on port 8000..."
vllm serve "Qwen/Qwen2-VL-72B-Instruct-GPTQ-Int4" \
    --port 8000 \
    --pipeline-parallel-size 4

# Alternative configurations:
# --tensor-parallel-size 4
# --gpu-memory-utilization 0.9
