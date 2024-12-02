#! /bin/sh

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset celeba --seed 1 --lr 1e-4 \
    --objective H --model H --batch_size 64 --z_dim 32 --max_iter 1.5e6 \
    --beta 10 --viz_name celeba_H_beta10_z32