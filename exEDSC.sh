#!/bin/bash
#SBATCH --partition=gpus
#SBATCH --gres=gpu:8
#SBATCH --output=output_file.log  # Specify the output file

python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.33 --out out1.png 2>&1
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.66 --out out2.png 2>&1

