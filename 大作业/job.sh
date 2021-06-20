#!/bin/bash
#SBATCH -o slurm.%j.out
#SBATCH -p compute
#SBATCH --qos=normal
#SBATCH -J lqy
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=36
#SBATCH --mail-type=end
#SBATCH --mail-user=circle20101561@163.com

echo 'Begin!'

module load anaconda/3-2020.02 

python Ising.py

echo ' '
echo 'job finished'
