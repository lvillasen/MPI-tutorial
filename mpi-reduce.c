#include <mpi.h>
#include <stdio.h>
int main(int argc, char** argv){
int size, rank, ierr;
MPI_Init(&argc,&argv);
MPI_Comm_size(MPI_COMM_WORLD,&size);
MPI_Comm_rank(MPI_COMM_WORLD,&rank);
int a, a_sum;
a=rank;
  printf("En proceso %i a = %i \n",rank,a);
     MPI_Reduce(&a, &a_sum,1,MPI_REAL,MPI_SUM,0,MPI_COMM_WORLD);
if( rank == 0 ){
  printf("La reduccion de a es =%i \n",a_sum);}
 ierr = MPI_Finalize();
}
