# Existing Modules with Python3.6

Within our cluster there are modules with existing python3 installations. You can just load one like:
```bash
ml suite/intel-parallel_studio_2019_3
```
If you only need numpy and mpi4py you are already done. If you wish to use more python modules you need to create a virtual environment. 

# Create virtual environment

The script create_venv.sh can be used to create a new environment.
```bash
bash create_venv.sh /scratch/username/path/to/new/environment
```

