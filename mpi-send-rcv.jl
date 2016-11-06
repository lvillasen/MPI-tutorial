using MPI
MPI.Init()
comm = MPI.COMM_WORLD
const rank = MPI.Comm_rank(comm)
const size = MPI.Comm_size(comm)
if rank == 0
 data11 = ones(3)*1
    data12 = ones(3)*2
    MPI.Send(data11,  1, 11, comm)
    MPI.Send(data12,  1, 12, comm)
elseif rank == 1
    data_recibida11 =zeros(3)
    data_recibida12 =zeros(3)
    MPI.Irecv!(data_recibida11, 0, 11, comm)
    MPI.Irecv!(data_recibida12, 0, 12, comm)  
end
MPI.Barrier(comm)
if rank == 1
println("En proceso ",rank,"  data_recibida11 =",data_recibida11)
println("En proceso ",rank,"  data_recibida12 =",data_recibida12)
end
MPI.Finalize() 
