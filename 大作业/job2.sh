#!/bin/bash
#SBATCH -o slurm.%j.out
#SBATCH -p compute
#SBATCH --qos=normal
#SBATCH -J lqy
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=36
#SBATCH --mail-type=end
#SBATCH --mail-user=circle20101561@163.com


module load matlab/R2021a

matlab -nodesktop -nosplash -nodisplay -r Ising2

echo ' '
echo 'job finished'
