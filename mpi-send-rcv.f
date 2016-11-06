       Program reduce
       include 'mpif.h'
       integer size, rank, count,o,in, tag, ie
       integer stat(MPI_STATUS_SIZE)   
       INTEGER, DIMENSION(0:2) :: datos11,datos12,data11_r,data12_r
       datos11 = (/11,11,11/)
       datos12 = (/12,12,12/)
       call MPI_INIT(ierr)
       call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ie)
       call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ie)
       if (rank .eq. 0) then
       call MPI_SEND(datos11,3, MPI_INTEGER,1,11,MPI_COMM_WORLD,ie)
       call MPI_SEND(datos12, 3, MPI_INTEGER,1,12,MPI_COMM_WORLD,ie)
       write(*,*) 'Datos enviados desde proceso 0 con tag 11 ='
     & ,datos11
       write(*,*) 'Datos enviados desde proceso 0 con tag 12 ='
     & ,datos12
       endif
       if (rank .eq. 1) then
       data11_r = (/0,0,0/)
       data12_r = (/0,0,0/)
       call MPI_RECV(data11_r,3,MPI_INTEGER,
     & 0,11,MPI_COMM_WORLD,stat,ie)
       call MPI_RECV(data12_r,3,MPI_INTEGER,
     & 0,12,MPI_COMM_WORLD,stat,ie)
       write(*,*) 'Datos recibidos en proceso 1 con tag 11 ='
     & ,data11_r
       write(*,*) 'Datos recibidos en proceso 1 con tag 12 ='
     & ,data12_r
       endif
       call MPI_FINALIZE(ie)
       end
