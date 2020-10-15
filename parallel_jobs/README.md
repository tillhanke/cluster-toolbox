# Why does this even exist?
The cluster currently does not accept the OverSubscribe option. In order to run multiple jobs on one node you need to use some "tricks". 

One way would be to use the background command option && within your bashscript. 

Another way could be to exclusively assign one node to all your jobs.

If this does not suite your needs you can also use the here described method of mpi within a bash script.

# MPI within a bash-script
This is only to enable sequential programms to run multiple times in a parallel manner. <br>
For "real" parallelization one should always use the mpi implementation of the programming language the programm is run in.<br>

## What does `mpiexec -n XX bash run.sh` do?
`mpiexec` spawns XX many processes on the cores of the cpu. Each of these processes run the same code (in this case `bash run.sh`). But each of these processes has a different assigned value for `$PMI_RANK`. So one can distinguish between the processes by using this variable.

## How can I run my programm?
Use the bashscript `run.sh` to call your programm. There are two methods of doing this. Either one passes the variable `$PMI_RANK` to the programm which should be executed e.g. `myprogram.bin --option $PMI_RANK` and lets the programm change its calculations depending on the option. <br> 
Or one uses `if` within bash e.g.:<br>
```bash
if [ $PMI_EXEC == "[id]" ]
then
    # put here the code that should be executed by the process with index [id]
fi
```

## What should I call?
Idealy the job should be constructed such that the single calls of the programm are running approximately the same time length. This means you should make sure that your programm on rank x is not running much longer than on every other rank.
