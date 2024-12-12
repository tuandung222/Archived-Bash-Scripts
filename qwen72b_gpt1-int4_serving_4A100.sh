# Description: Script to serve the Qwen2-VL-72B-Instruct-GPTQ-Int4 model.

# Activate the conda environment:
eval "$(conda shell.bash hook)"
conda activate vllm

# Load and run the model:
vllm serve "Qwen/Qwen2-VL-72B-Instruct-GPTQ-Int4" \
--port 8000 --pipeline-parallel-size 4
# --tensor-parallel-size 4
# --pipeline-parallel-size 4


# --tensor-parallel-size 
# --pipeline-parallel-size 
# --gpu-memory-utilization
