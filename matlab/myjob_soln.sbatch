#!/bin/bash
#SBATCH --job-name=myjob
#SBATCH --partition=dev
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=10:00
#SBATCH --mail-type=ALL
#SBATCH --output=myjob.%j.out
#SBATCH --error=myjob.%j.err

ml purge
ml matlab

matlab -nodisplay < roi_detection.m
