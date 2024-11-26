# β-VAE
Github code builds upon [WonKwang Lee and Tony Metger] 

Pytorch reproduction of two papers below:
1. [β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]
2. [Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]
<br>

## Getting Started 

#### Clone the repository

```bash
git clone https://github.com/lesupermomo/B-VAE.git
```

#### Create a Virtual Environment
Create a virtual environment to isolate your project dependencies.

```bash
python3 -m venv venv
```

#### Activate the Virtual Environment

```bash
source venv/bin/activate
```

#### Install the Required Dependencies

```bash
pip install -r requirements.txt
```

#### Download the Dataset
Run the following command to download the dataset:

```bash
./scripts/prepare_data.sh 3DChairs
./scripts/prepare_data.sh dsprites
./scripts/prepare_data.sh CelebA
```

#### Start a viz session to monitor results

```bash
python -m visdom.server
```
You can then monitor the experiments plots and results at http://localhost:8097/.

#### Run the Experiment
Start running an experiment with the following command:

```bash
./scripts/run_dsprites_B_gamma100_z10.sh
```
This will initiate the experiment with the specified parameters.

## Results

#### dSprites
```
./scripts/run_dsprites_B_gamma100_z10.sh
```

| Reconstruction Loss - KL Divergence - Posterior Variance |
|-----------------------------|
| <p align="center"><img src="misc/dsprites_plot.png"></p> |

| latent traversal |
|-----------------------------|
| <p align="center"> <img src=misc/dsprites_traverse_ellipse.gif> <img src=misc/dsprites_traverse_heart.gif> <img src=misc/dsprites_traverse_random.gif> </p>|


| Input Image vs Reconstruction |
|-----------------------------|
| <p align="center"><img src="misc/dsprites_reconstruction.jpg"></p> |


#### 3D Chairs
```
./scripts/run_3dchairs_H_beta4_z10.sh
```
![3dchairs_beta4_z16](misc/3dchairs_H_beta4_z10_traverse.png)
```
./scripts/run_3dchairs_H_beta4_z16.sh
```
![3dchairs_beta4_z16](misc/3dchairs_H_beta4_z16_traverse.png)


#### CelebA
```
./scripts/run_celeba_H_beta10_z10.sh
```
![celeba](misc/celeba_H_beta10_z10_traverse.png)
```
./scripts/run_celeba_H_beta10_z32.sh
```
![celeba](misc/celeba_H_beta10_z32_traverse.png)



### Reference
1. [β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]
2. [Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]
3. [Github Repo]: Tensorflow implementation from [miyosuda]

[β-VAE: Learning Basic Visual Concepts with a Constrained Variational Framework, Higgins et al., ICLR, 2017]: https://openreview.net/pdf?id=Sy2fzU9gl
[Understanding disentangling in β-VAE, Burgess et al., arxiv:1804.03599, 2018]: http://arxiv.org/abs/1804.03599
[WonKwang Lee and Tony Metger]: https://github.com/1Konny/Beta-VAE?tab=readme-ov-file
[Github Repo]: https://github.com/miyosuda/disentangled_vae
[miyosuda]: https://github.com/miyosuda
