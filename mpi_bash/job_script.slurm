#!/bin/bash

#SBATCH -p intel4    # queue
#SBATCH -J dirty-mpi # jobname

#SBATCH -o stdout.o  # STDOUT
#SBATCH -e err.e  # STDERR

#SBATCH --time=00:01:00 # Erwartete Laufzeit


## RUN ##
#########

ml suite  # neccesary to load a module with mpi
echo $HOSTNAME
mpiexec -n 16 bash run.sh 
