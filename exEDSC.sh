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

python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.053 --out frames/out1.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.105 --out frames/out2.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.158 --out frames/out3.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.211 --out frames/out4.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.264 --out frames/out5.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.316 --out frames/out6.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.369 --out frames/out7.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.422 --out frames/out8.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.475 --out frames/out9.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.527 --out frames/out10.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.580 --out frames/out11.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.633 --out frames/out12.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.686 --out frames/out13.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.739 --out frames/out14.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.792 --out frames/out15.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.845 --out frames/out16.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.897 --out frames/out17.png 
python3 run.py --model EDSC_m --model_state EDSC_m.ckpt --time 0.950 --out frames/out18.png 

end=`date +%s`

RUNTIME=$((end-start))
echo "finished generating frames in $RUNTIME"

echo "creating gif..."

convert -delay 2 -loop 0 frames/*.png output.gif





