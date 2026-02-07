# Network & SSH Utilities

Scripts for network management and SSH tunneling.

## Scripts

### forward-port.sh
**Description**: Create SSH port forwarding tunnel  
**Usage**: `bash forward-port.sh <user@host> <remote_port> <local_port> [ssh_port]`  
**Example**: `bash forward-port.sh user@server.com 8080 8080 22`  
**Use cases**:
- Access remote web services locally
- Secure database connections
- Remote development environments
- Bypass firewall restrictions

## Common Workflows

### Forward Web Service
```bash
# Forward remote Jupyter to local port 8888
bash forward-port.sh user@gpu-server.com 8888 8888

# Access in browser
# Open http://localhost:8888
```

### Forward Database
```bash
# Forward remote PostgreSQL to local port 5432
bash forward-port.sh dbuser@db-server.com 5432 5432

# Connect using local client
psql -h localhost -p 5432 -U username
```

### Forward Custom Service
```bash
# Forward with custom SSH port
bash forward-port.sh user@server.com 10000 10000 11031
```

### Multiple Tunnels
```bash
# Open multiple tunnels in background
bash forward-port.sh user@server.com 8888 8888 &
bash forward-port.sh user@server.com 6006 6006 &
bash forward-port.sh user@server.com 8080 8080 &
```

## SSH Tunnel Tips

### Keep Tunnel Alive
Add to `~/.ssh/config`:
```
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
```

### List Active Tunnels
```bash
ps aux | grep ssh | grep "\-L"
```

### Close Tunnel
```bash
# Find tunnel process ID
ps aux | grep "ssh.*-L.*<port>"

# Terminate specific tunnel
kill <PID>
```

### Auto-Reconnect
Use `autossh` for persistent tunnels:
```bash
# Install autossh
sudo apt-get install autossh

# Create persistent tunnel
autossh -M 0 -N -f -L 8888:127.0.0.1:8888 user@server.com
```

## SSH Configuration

### Setup SSH Keys (Recommended)
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy to remote server
ssh-copy-id user@server.com

# Test connection
ssh user@server.com
```

### SSH Config Example
Add to `~/.ssh/config`:
```
Host gpu-server
    HostName gpu-server.example.com
    User myusername
    Port 22
    IdentityFile ~/.ssh/id_ed25519
    LocalForward 8888 127.0.0.1:8888
    LocalForward 6006 127.0.0.1:6006
```

Usage:
```bash
ssh gpu-server  # Automatically forwards ports
```

## Security Notes

- Always use SSH keys instead of passwords
- Limit port forwarding to localhost (127.0.0.1)
- Use VPN for sensitive services
- Monitor active SSH connections
- Close unused tunnels

## Troubleshooting

**Issue**: Connection refused  
**Solution**: Check if remote service is running and firewall allows connections

**Issue**: Port already in use  
**Solution**: Choose different local port or close existing tunnel

**Issue**: Tunnel drops frequently  
**Solution**: Use autossh or adjust ServerAliveInterval

**Issue**: Permission denied  
**Solution**: Check SSH key permissions (should be 600)
