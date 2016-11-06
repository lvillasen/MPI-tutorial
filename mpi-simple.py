from mpi4py import MPI;import socket
comm = MPI.COMM_WORLD
size = MPI.COMM_WORLD.Get_size()
rank = comm.Get_rank()
host=socket.gethostname()
a=rank
for i in range(size):
   if i==rank:
       print("a=%d en proceso %d de %d en %s"%(a,rank, size,host))
MPI.Finalize()
