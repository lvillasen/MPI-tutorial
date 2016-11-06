from mpi4py import MPI; import numpy as np ; import random
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
if rank == 0:
   data11 = np.ones(3)*11
   data12 = np.ones(3)*12
   comm.send(data11, dest=1, tag=11)
   comm.send(data12, dest=1, tag=12)
elif rank == 1:
   data11_r = np.zeros(3)
   data12_r = np.zeros(3)
   data11_r = comm.recv(source=0, tag=11)
   data12_r = comm.recv(source=0, tag=12)
   print("En proceso %d, data11_recibido =%s"%(rank, data11_r))
   print("En proceso %d, data12_recibido =%s"%(rank, data12_r))
MPI.Finalize()
