#!/bin/bash
# Description: Examples for managing and terminating processes
# Usage: bash process-management-examples.sh

cat << 'EXAMPLES'
Process Management Examples
============================

View running processes:
  ps aux | grep python
  ps aux | grep jupyter
  ps aux | grep vllm

Terminate processes by pattern (use with caution):
  
1. Terminate Python processes:
   ps aux | grep python | grep -v grep | awk '{print $2}' | xargs -r kill -9

2. Terminate wandb processes:
   ps aux | grep wandb | grep -v grep | awk '{print $2}' | xargs -r kill -9

3. Terminate VS Code processes:
   ps aux | grep code | grep -v grep | awk '{print $2}' | xargs -r kill -9

4. Terminate Python (exclude Jupyter):
   ps aux | grep python | grep -v jupyter | grep -v grep | awk '{print $2}' | xargs -r kill -9

5. Terminate vLLM processes:
   ps aux | grep vllm | grep -v grep | awk '{print $2}' | xargs -r kill -9

Note: The -r flag in xargs prevents execution if no PIDs are found
EXAMPLES
