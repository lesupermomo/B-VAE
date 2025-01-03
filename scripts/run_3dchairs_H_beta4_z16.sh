#! /bin/sh

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset 3dchairs --seed 1 --lr 1e-4 \
    --objective H --model H --batch_size 64 --z_dim 16 --max_iter 1.5e6 \
    --beta 4 --viz_name 3dchairs_H_beta4_z16