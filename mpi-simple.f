      Program simple
      include 'mpif.h'
      integer size,rank,ie,a,len
      character(MPI_MAX_PROCESSOR_NAME) host
      len=20
      call MPI_INIT(ie)
      call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ie)
      call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ie)
      call MPI_GET_PROCESSOR_NAME(host, len, ie)
      a=rank
      WRITE(*,10) 'a=', a,' en proceso ',
     &rank,' de ', size,' en ',host
  10  Format(1x,A4,I2,A12,I2,A4,I2,A4,A20)
      call MPI_FINALIZE(ie)
      end
