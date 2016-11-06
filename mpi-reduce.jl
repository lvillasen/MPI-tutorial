using MPI
MPI.Init()
comm = MPI.COMM_WORLD
const rank = MPI.Comm_rank(comm)
const size = MPI.Comm_size(comm)
a=rank
print("a = $rank en proceso $rank de un total de $size\n")
Sum = MPI.Reduce(a, MPI.SUM, 0, comm)
if rank == 0
 print("La suma = $Sum en el proceso $rank \n",);
end
MPI.Finalize() 
