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

python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.5 --out frames/out1.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 1.0 --out frames/out2.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 1.5 --out frames/out3.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 2.0 --out frames/out4.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 2.5 --out frames/out5.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 3.0 --out frames/out6.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 3.5 --out frames/out7.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 4.0 --out frames/out8.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 4.5 --out frames/out9.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 5.0 --out frames/out10.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 5.5 --out frames/out11.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 6.0 --out frames/out12.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 6.5 --out frames/out13.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 7.0 --out frames/out14.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 7.5 --out frames/out15.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 8.0 --out frames/out16.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 8.5 --out frames/out17.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 9.0 --out frames/out18.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 9.5 --out frames/out19.png

end=`date +%s`

RUNTIME=$((end-start))
echo "finished generating frames in $RUNTIME"

echo "creating gif..."

convert -delay 2 -loop 0 frames/*.png output.gif





