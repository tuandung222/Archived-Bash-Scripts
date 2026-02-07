# AI/ML Tools

Scripts for setting up and managing machine learning and artificial intelligence infrastructure.

## Scripts

### DDP_pytorch-example.sh
**Description**: Distributed PyTorch training example  
**Usage**: Configure and launch multi-GPU PyTorch training jobs with torchrun

### install-anaconda-kernels.sh
**Description**: Register all Conda environments as Jupyter kernels  
**Usage**: `bash install-anaconda-kernels.sh`  
**Requirements**: Anaconda/Miniconda installed

### setup-huggingface-env.sh
**Description**: Configure Hugging Face cache and environment variables  
**Usage**: `bash setup-huggingface-env.sh`  
**Effect**: Modifies ~/.bashrc with HF_HOME, HF_DATASETS_CACHE, TRANSFORMERS_CACHE

### setup-hf-transfer.sh
**Description**: Enable fast Hugging Face Hub downloads  
**Usage**: `bash setup-hf-transfer.sh`  
**Effect**: Installs hf_transfer and enables HF_HUB_ENABLE_HF_TRANSFER

### qwen72b_gpt1-int4_serving_4A100.sh
**Description**: Serve Qwen2-VL-72B GPTQ INT4 model with vLLM  
**Requirements**: 4x A100 GPUs, vLLM installed

### upload_by_huggingface_cli.sh
**Description**: Template commands for uploading to Hugging Face Hub  
**Usage**: View file for examples

### convert_jupyter_notebook_to_html.sh
**Description**: Convert Jupyter notebooks to HTML with embedded images  
**Usage**: `bash convert_jupyter_notebook_to_html.sh`

### load_multiple_parquet_file
**Description**: Python snippet for loading multiple Parquet files into Hugging Face datasets  
**Usage**: View file for code example

## Common Workflows

### Setup ML Environment
```bash
# 1. Configure Hugging Face
bash setup-huggingface-env.sh
source ~/.bashrc

# 2. Enable fast downloads
bash setup-hf-transfer.sh
source ~/.bashrc

# 3. Setup Jupyter kernels
bash install-anaconda-kernels.sh
```

### Model Serving
```bash
# Serve large language model
bash qwen72b_gpt1-int4_serving_4A100.sh
```
