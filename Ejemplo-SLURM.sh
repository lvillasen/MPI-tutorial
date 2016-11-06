#!/bin/bash
#SBATCH --job-name mpi_simple
#SBATCH --nodes 3
#SBATCH --ntasks-per-node 24
#SBATCH --time 00:10:00
#SBATCH --output mpi-simple.out
module load tools/intel/impi/5.0.2.044
mpirun mpi-simple
