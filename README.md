# β-VAE
Github code is based on [WonKwang Lee and Tony Metger] 

Pytorch reproduction of two papers below:
1. [β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]
2. [Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]
<br>


### Results
#### 3D Chairs
```
sh run_3dchairs_H_beta4_z10.sh
```
![3dchairs_beta4_z16](misc/3dchairs_H_beta4_z10_traverse.png)
```
sh run_3dchairs_H_beta4_z16.sh
```
![3dchairs_beta4_z16](misc/3dchairs_H_beta4_z16_traverse.png)
#### CelebA
```
sh run_celeba_H_beta10_z10.sh
```
![celeba](misc/celeba_H_beta10_z10_traverse.png)
```
sh run_celeba_H_beta10_z32.sh
```
![celeba](misc/celeba_H_beta10_z32_traverse.png)
#### dSprites
```
sh run_dsprites_B.sh
```
##### visdom line plot
![dsprites_plot](misc/dsprites_plot.png)
##### latent traversal gif(```--save_output True```)
<p align="center">
<img src=misc/dsprites_traverse_ellipse.gif>
<img src=misc/dsprites_traverse_heart.gif>
<img src=misc/dsprites_traverse_random.gif>
</p>
##### reconstruction(left: true, right: reconstruction)
<p align="center">
<img src=misc/dsprites_reconstruction.jpg>
</p>


### Reference
1. [β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]
2. [Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]
3. [Github Repo]: Tensorflow implementation from [miyosuda]

[β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]: https://openreview.net/pdf?id=Sy2fzU9gl
[Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]: http://arxiv.org/abs/1804.03599
[WonKwang Lee and Tony Metger]: https://github.com/1Konny/Beta-VAE?tab=readme-ov-file
[Github Repo]: https://github.com/miyosuda/disentangled_vae
[miyosuda]: https://github.com/miyosuda
