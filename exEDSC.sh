#!/bin/bash
#SBATCH --partition=gpus
#SBATCH --gres=gpu:8
# #SBATCH --output=output_file.log  # Specify the output file

if command -v nvidia-smi &> /dev/null; then
	    echo "NVIDIA GPUs found:"
	        nvidia-smi --list-gpus
	else
	    echo "No NVIDIA GPUs found."
fi
start=`date +%s`

python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.1 --out frames/out1.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.2 --out frames/out2.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.3 --out frames/out3.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.4 --out frames/out4.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.5 --out frames/out5.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.6 --out frames/out6.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.7 --out frames/out7.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.8 --out frames/out8.png 2>&1
# python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.9 --out frames/out9.png 2>&1

end=`date +%s`

RUNTIME=$((end-start))
echo "finished generating frames in $RUNTIME"

