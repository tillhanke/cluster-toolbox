# MPI within a bash-script
This is only to enable sequential programms to run multiple times in a parallel manner. <br>
For "real" parallelization one should always use the mpi implementation of the programming language the programm is run in.<br>

## What does `mpiexec -n XX bash run.sh` do?
`mpiexec` spawns XX many processes on the cores of the cpu. Each of these processes run the same code (in this case `bash run.sh`). But each of these processes has a different assigned value for `$PMI_RANK`. So one can distinguish between the processes by using this variable.

## How can I run my programm?
Use the bashscript `run.sh` to call your programm. There are two methods of doing this. Either one passes the variable `$PMI_RANK` to the programm which should be executed e.g. `myprogram.exe --option $PMI_RANK` and lets the programm change its calculations depending on the option. <br> 
Or one uses `if` within bash e.g.:<br>
```bash
if [ $PMI_EXEC == "3" ]
then
    # put here the code that should be executed by the 4th process
fi
```

## What should I call?
Idealy the job should be constructed such that the single calls of the programm are running approximately the same time length. This means you should make sure that your programm on rank x is not running much longer than on every other rank.
