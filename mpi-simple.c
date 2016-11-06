 #include <stdio.h>
   #include <mpi.h>
   main(int argc, char **argv)
   {
      int ierr, rank, size;
    char hostname[30]; 
      ierr = MPI_Init(&argc, &argv);
      ierr = MPI_Comm_rank(MPI_COMM_WORLD, &rank);
      ierr = MPI_Comm_size(MPI_COMM_WORLD, &size);
      gethostname(hostname,30);
int a= rank;
      printf("a=%i en  proceso %i de un total de %i en %s\n", 
         a,rank, size,hostname);
      ierr = MPI_Finalize();
   }
