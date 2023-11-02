#!/bin/bash
#SBATCH --job-name=myjob
#SBATCH --partition=dev
#SBATCH --cpus-per-task=1
#SBATCH --gpus=1
#SBATCH --mem=16GB
#SBATCH --time=10:00
#SBATCH --mail-type=ALL
#SBATCH --output=myjob.%j.out
#SBATCH --error=myjob.%j.err

ml purge
ml python/3.9.0
ml py-tensorflow/2.10.0_py39
ml viz
ml py-matplotlib/3.4.2_py39

python3 cifar_cnn.py
