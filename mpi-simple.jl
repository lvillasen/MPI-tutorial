using MPI
MPI.Init()
comm = MPI.COMM_WORLD
const rank = MPI.Comm_rank(comm)
const size = MPI.Comm_size(comm)
a=rank
print("a=$a en proceso $rank de un total de $size\n" )
MPI.Finalize()
