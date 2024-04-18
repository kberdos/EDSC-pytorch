#!/bin/bash
#SBATCH --partition=gpus
#SBATCH --gres=gpu:8

if command -v nvidia-smi &> /dev/null; then
	    echo "NVIDIA GPUs found:"
	        nvidia-smi --list-gpus
	else
	    echo "No NVIDIA GPUs found."
fi
start=`date +%s`

echo "running python scripts"

python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.1 --out frames/out1.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.2 --out frames/out2.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.3 --out frames/out3.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.4 --out frames/out4.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.5 --out frames/out5.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.6 --out frames/out6.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.7 --out frames/out7.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.8 --out frames/out8.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.9 --out frames/out9.png 

end=`date +%s`

RUNTIME=$((end-start))
echo "finished generating frames in $RUNTIME"

