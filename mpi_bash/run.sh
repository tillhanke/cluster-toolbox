#!/bin/bash

echo "I am rank $PMI_RANK my size is $PMI_SIZE"

# this can be used for example with a if case:
if [ $PMI_RANK == "2" ]
then
    echo "I am the rank two"
    # here you could call a programm, that will only run on rank 2
fi

# One could also just pass the rank into the programm as a argument
# myprogramm.executable --option $PMI_RANK
