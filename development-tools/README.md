# Development Tools

Scripts for setting up development environments and tools.

## Scripts

### install-java-sdk.sh
**Description**: Install OpenJDK on Ubuntu/Debian  
**Usage**: `bash install-java-sdk.sh [version]`  
**Example**: `bash install-java-sdk.sh 17`  
**Default**: OpenJDK 17

### install-jenkins.sh
**Description**: Install Jenkins CI/CD server  
**Usage**: `bash install-jenkins.sh`  
**Post-install**: Access at http://localhost:8080  
**Get initial password**: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

### install-nodejs.sh
**Description**: Install Node.js 22 using NVM  
**Usage**: `bash install-nodejs.sh`  
**Note**: Requires shell restart to activate NVM

### install-git-lfs.sh
**Description**: Install and configure Git Large File Storage  
**Usage**: `bash install-git-lfs.sh`  
**Effect**: Installs git-lfs and initializes for current user

### vscode_extension_install.sh
**Description**: Backup and restore VS Code extensions  
**Usage**: `bash vscode_extension_install.sh`  
**Effect**: Exports extensions list and provides reinstall command

### vscode_tunnel.sh
**Description**: Start VS Code remote tunnel  
**Usage**: `bash vscode_tunnel.sh`  
**Effect**: Downloads VS Code CLI and starts tunnel session

## Common Workflows

### Java Development Setup
```bash
# Install Java
bash install-java-sdk.sh 17

# Verify installation
java -version
javac -version
```

### Node.js Development Setup
```bash
# Install Node.js
bash install-nodejs.sh

# Restart shell, then verify
node --version
npm --version
```

### CI/CD Setup
```bash
# Install Jenkins
bash install-jenkins.sh

# Get initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### VS Code Remote Development
```bash
# Setup VS Code tunnel
bash vscode_tunnel.sh

# Backup extensions
bash vscode_extension_install.sh
```
