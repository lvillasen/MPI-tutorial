       Program reduce
       include 'mpif.h'
       integer size, rank, count,a,a_sum, tag, ierr
       integer stat(MPI_STATUS_SIZE)   
       call MPI_INIT(ierr)
       call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
       call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr)
       a=rank
       write(*,10) 'En proceso ', rank, ' a=',a
   10  Format(1x,A15,2x,I2, A4,I2)
       call MPI_REDUCE(a,a_sum,1,MPI_INTEGER,
     & MPI_SUM,0,MPI_COMM_WORLD,ierr)
       if (rank .eq. 0) then
       write(*,20) 'La suma de a es ',a_sum
   20  Format(1x,A20,2x,I2)
       endif
       call MPI_FINALIZE(ierr)
       end
