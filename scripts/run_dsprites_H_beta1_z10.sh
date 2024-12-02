#! /bin/sh

# This experiment will be used to compare the latent space like in the paper, B-VAE vs VAE for dsprites dataset

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset dsprites --seed 2 --lr 5e-4 --beta1 0.9 --beta2 0.999 \
    --objective H --model H --batch_size 64 --z_dim 10 --max_iter 1.5e6 \
    --beta 1 --viz_name dsprites_H_beta1_z10
