#!/bin/bash
#SBATCH --partition=gpus
#SBATCH --gres=gpu:8

echo "Checking GPUs on the system..."

# Use the nvidia-smi command to list information about NVIDIA GPUs
# exec > out.txt

# Use the nvidia-smi command to list information about NVIDIA GPUs
if command -v nvidia-smi &> /dev/null; then
	    echo "NVIDIA GPUs found:"
	        nvidia-smi --list-gpus
	else
	    echo "No NVIDIA GPUs found."
fi

# You can also check for AMD GPUs or other GPU vendors using appropriate commands
# For AMD GPUs, you might use 'lspci | grep -i amd' or other similar commands

# Add more commands here to check for other GPU vendors if needed

echo "GPU check complete."
