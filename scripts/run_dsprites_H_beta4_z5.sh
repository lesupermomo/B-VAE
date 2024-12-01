#! /bin/sh

# This experiment aims to show that the latent space for the VAE and B-VAE are equivalent when z=5

cd "$(dirname "$0")"
CUDA_VISIBLE_DEVICES=0 python ../main.py --dataset dsprites --seed 2 --lr 5e-4 \
    --objective H --model H --batch_size 64 --z_dim 5 --max_iter 1.5e6 \
    --beta 4 --viz_name dsprites_H_beta4_z5