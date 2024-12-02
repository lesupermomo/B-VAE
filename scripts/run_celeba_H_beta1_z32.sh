#! /bin/sh

# this experiment will be used to capture how good the model introduced by (B) is good for retaining good reconstructions

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset celeba --seed 1 --lr 5e-4 --beta1 0.9 --beta2 0.999 \
    --objective H --model H --batch_size 64 --z_dim 32 --max_iter 1.5e6 \
    --beta 1 --viz_name celeba_H_beta1_z32
