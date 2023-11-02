#!/bin/bash
#SBATCH --job-name=myjob
#SBATCH --partition=dev
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --time=10:00
#SBATCH --mail-type=ALL
#SBATCH --output=myjob.%j.out
#SBATCH --error=myjob.%j.err

ml purge
ml R/4.2.0

export R_LIBS_USER=~/R/x86_64-pc-linux-gnu-library/4.2
mkdir -p $R_LIBS_USER

Rscript parallel_eigens.R
