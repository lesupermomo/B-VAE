#! /bin/sh

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset dsprites --seed 2 --lr 5e-4 \
    --objective B --model B --batch_size 64 --z_dim 10 --max_iter 1.5e6 \
    --C_stop_iter 1e5 --C_max 20 --gamma 100 --viz_name dsprites_B_gamma100_z10