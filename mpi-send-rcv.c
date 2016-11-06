#include <mpi.h>
#include <stdio.h>
int main(int argc, char** argv){
int size, rank, rc;
MPI_Init(&argc,&argv);
MPI_Comm_size(MPI_COMM_WORLD,&size);
MPI_Comm_rank(MPI_COMM_WORLD,&rank);
MPI_Status Stat;
int i,a, a_sum;
if( rank == 0 ){
int datos11[3] = { 11,11,11};
int datos12[3] = { 12,12,12};
rc = MPI_Send(&datos11, 3, MPI_INT, 1, 11, MPI_COMM_WORLD);
rc = MPI_Send(&datos12, 3, MPI_INT, 1, 12, MPI_COMM_WORLD);
}
if( rank == 1 ){
int datos11_r[3] = { 0,0,0};
int datos12_r[3] = { 0,0,0};
rc = MPI_Recv(&datos11_r, 3, MPI_INT, 0, 11, MPI_COMM_WORLD,&Stat );
rc = MPI_Recv(&datos12_r, 3, MPI_INT, 0, 12, MPI_COMM_WORLD,&Stat);
   printf("Datos recibidos en proceso %i con tag 11:\n", rank);
for(i = 0; i < 3; i++) {
   printf("%d ", datos11_r[i]);
    }
   printf("\nDatos recibidos en proceso %i con tag 12:\n", rank);
for(i = 0; i < 3; i++) {
   printf("%d ", datos12_r[i]);
    }
}
rc = MPI_Finalize();
}
