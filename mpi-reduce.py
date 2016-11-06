from mpi4py import MPI;import numpy ;import random
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
a = random.randint(0,3)
A=numpy.ones(3)*random.randint(0,3)
print("En proceso %d a = %s A= %s" % (rank,a,A))
sum_a = comm.reduce(a, op=MPI.SUM, root =0)
sum_A = comm.reduce(A, op=MPI.SUM, root =0)
if rank == 0:
    print("La suma de a es %s y la de A es %s" % (sum_a,sum_A))
MPI.Finalize()
