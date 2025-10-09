# Archived Bash Scripts Overview

This document provides a quick comment on each script or note stored in this archive so you can immediately see what purpose every file serves.

| File | Comment |
| --- | --- |
| `DDP_pytorch-example.sh` | Launches a PyTorch distributed training job with `torchrun`, including rendezvous settings and optimizer overrides for an ALBEF-based configuration. |
| `NVIDIA_SETUP_GUIDE[OPTIONAL].md` | Markdown guide that documents optional steps for preparing NVIDIA software on a workstation. |
| `axolotl-jupyter-docker-start.sh` | Runs the Axolotl Docker image with GPU access and boots a ready-to-use JupyterLab session. |
| `bitnet-install` | Dockerfile that builds Microsoft BitNet from source, generates TL2 kernels, and runs inference with a bundled GGUF model. |
| `cat_etc_docker_daemon_json` | Prints a sample `/etc/docker/daemon.json` configured to use the NVIDIA container runtime by default. |
| `check_free_gpu_then_exec.sh` | Monitors free memory on GPU 0 and executes a target script once the available memory exceeds a defined threshold. |
| `convert_jupyter_notebook_to_html.sh` | Uses Jupyter nbconvert to export a notebook (including embedded images) to HTML with a custom output name. |
| `forward-port` | Opens an SSH tunnel that forwards local port 10000 to a remote service through port 11031. |
| `install-docker-on-linux` | Removes conflicting container packages, adds the official Docker repository, and installs the Docker Engine stack. |
| `install-flash-attention-2.sh` | Installs FlashAttention v2 from source using `uv` to manage build dependencies and editable installs. |
| `install-flash-attention.sh` | Installs the FlashAttention package from PyPI after ensuring `ninja` and `packaging` are available. |
| `install-java-sdk` | Installs a specified OpenJDK version using the system package manager. |
| `install-jenkins` | Adds the Jenkins repository and installs the Jenkins service, with optional sudo aliasing for root execution. |
| `install-nodejs-on-linux.sh` | Installs Node.js 22 via NVM and documents verification steps. |
| `install-nvidia-container-toolkit.sh` | Adds NVIDIA container toolkit repositories, installs specific toolkit versions, and configures Docker runtimes. |
| `install_anaconda_enviroments_as_jupyter_ipykernels.sh` | Registers every Conda environment as a Jupyter kernel by installing `ipykernel` and invoking the kernel installer. |
| `install_cuda_toolkit_12_6.sh` | Downloads and installs the CUDA 12.6 repository, installs the toolkit, and symlinks `/usr/local/cuda`. |
| `install_git_lfs.sh` | Installs Git Large File Storage, initializes it for the current user, and verifies the installation. |
| `kill_processes_on_linux` | Terminates processes related to Python, Weights & Biases, VS Code, and vLLM using `ps`, `grep`, and `kill`. |
| `load_multiple_parquet_file` | Provides a Python snippet that loads multiple Parquet files into a Hugging Face `datasets` Dataset. |
| `qwen72b_gpt1-int4_serving_4A100.sh` | Activates a Conda environment and serves the Qwen2-VL-72B GPTQ INT4 model with vLLM across four GPUs. |
| `set_hf_enviroments.sh` | Backs up `.bashrc` and configures Hugging Face cache and transfer environment variables. |
| `set_hf_transfer.sh` | Installs `hf_transfer` dependencies and ensures HF transfer acceleration is enabled in `.bashrc`. |
| `start_jenkins_container.sh` | Starts a Jenkins Docker container, waits for initialization, and stores both container ID and admin password locally. |
| `untar_gz_tar_file.sh` | Installs `tar` if necessary and extracts a specified `.tar.gz` archive. |
| `upload_by_huggingface_cli.sh` | Provides template commands for uploading models or folders to Hugging Face using the CLI. |
| `view_size_subfolders.sh` | Lists subdirectories by size using `du` and sorts them in descending order. |
| `vscode_extension_install.sh` | Exports the current VS Code extensions list and reinstalls them from that file. |
| `vscode_tunnel.sh` | Downloads the VS Code CLI and starts a remote tunnel session. |
| `zip_folder_by_tar.sh` | Validates input arguments and tars a directory into a compressed archive. |
