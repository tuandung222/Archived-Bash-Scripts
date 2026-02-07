# Docker & Container Management

Scripts for Docker installation, configuration, and containerized services.

## Scripts

### install-docker.sh
**Description**: Install Docker Engine on Ubuntu/Debian  
**Usage**: `bash install-docker.sh`  
**Post-install**: Log out and back in for group changes to take effect  
**Test**: `docker run hello-world`

### docker-daemon-nvidia.json
**Description**: Sample Docker daemon configuration for NVIDIA runtime  
**Location**: Should be placed at `/etc/docker/daemon.json`  
**Purpose**: Set NVIDIA as default container runtime  
**Usage**: 
```bash
sudo cp docker-daemon-nvidia.json /etc/docker/daemon.json
sudo systemctl restart docker
```

### bitnet.Dockerfile
**Description**: Dockerfile for Microsoft BitNet inference  
**Usage**: 
```bash
docker build -f bitnet.Dockerfile -t bitnet:latest .
docker run -it bitnet:latest
```
**Requirements**: ggml-model-i2_s.gguf model file

### start-jenkins-container.sh
**Description**: Launch Jenkins in Docker container  
**Usage**: `bash start-jenkins-container.sh`  
**Effect**: Starts Jenkins container and saves admin password  
**Access**: http://localhost:8080

### axolotl-jupyter-docker-start.sh
**Description**: Run Axolotl ML framework with JupyterLab in Docker  
**Usage**: `bash axolotl-jupyter-docker-start.sh`  
**Requirements**: NVIDIA GPU and nvidia-docker runtime

## Common Workflows

### Initial Docker Setup
```bash
# 1. Install Docker
bash install-docker.sh

# 2. Log out and log back in

# 3. Test installation
docker run hello-world

# 4. (Optional) Configure NVIDIA runtime
sudo cp docker-daemon-nvidia.json /etc/docker/daemon.json
sudo systemctl restart docker
```

### Jenkins in Docker
```bash
# Start Jenkins container
bash start-jenkins-container.sh

# View admin password
cat jenkins_admin_password.txt

# Access Jenkins
# Open browser to http://localhost:8080
```

### ML Development with Docker
```bash
# Start Axolotl with Jupyter
bash axolotl-jupyter-docker-start.sh

# Access JupyterLab in browser
```

## Tips

- Always use specific image tags in production
- Use volume mounts to persist data
- Configure resource limits for production containers
- Use docker-compose for multi-container applications
- Regularly update base images for security patches
