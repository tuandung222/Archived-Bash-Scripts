# File Operations

Utilities for file system management, archiving, and process control.

## Scripts

### archive-folder.sh
**Description**: Create compressed tar.gz archive from a directory  
**Usage**: `bash archive-folder.sh <source_folder> [output_name]`  
**Example**: `bash archive-folder.sh my_data backup.tar.gz`  
**Default output**: `<source_folder>.tar.gz`

### extract-archive.sh
**Description**: Extract tar.gz archives  
**Usage**: `bash extract-archive.sh <archive_file>`  
**Example**: `bash extract-archive.sh backup.tar.gz`  
**Auto-installs**: tar utility if not present

### view-directory-sizes.sh
**Description**: Display subdirectories sorted by size (largest first)  
**Usage**: `bash view-directory-sizes.sh [directory]`  
**Example**: `bash view-directory-sizes.sh /home/user`  
**Default**: Current directory

### process-management-examples.sh
**Description**: Examples for managing and terminating processes  
**Usage**: `bash process-management-examples.sh`  
**Note**: Displays examples, does not execute commands

## Common Workflows

### Backup Data
```bash
# Archive a directory
bash archive-folder.sh /path/to/data backup-2024.tar.gz

# Verify archive
tar -tzf backup-2024.tar.gz | head
```

### Restore Data
```bash
# Extract archive
bash extract-archive.sh backup-2024.tar.gz

# Verify extracted contents
ls -lh
```

### Disk Space Analysis
```bash
# Check current directory
bash view-directory-sizes.sh

# Check specific directory
bash view-directory-sizes.sh /var/log

# Find largest directories
bash view-directory-sizes.sh / | head -20
```

### Process Management
```bash
# View examples
bash process-management-examples.sh

# Terminate specific processes (example)
ps aux | grep python | grep -v grep | awk '{print $2}' | xargs -r kill -9
```

## Safety Tips

- Always verify archive contents before extraction
- Keep backups in multiple locations
- Test archives after creation
- Be cautious with process termination commands
- Use `ps aux | grep pattern` to preview processes before termination
