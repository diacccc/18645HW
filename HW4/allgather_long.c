#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>

/****************************************
 buffer - send and receive buffers
 size - the size of data hold by each process before the allgather
 own_id - the id of the current process
 world_size - the total number of process
*/
void bkt_allgather(double *buffer, int size, int own_id, int world_size) {
  
}

// the size of the array must be a multiple of the number of processes
int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int size = atoi(argv[1]);
    
    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int private_data_size = size / world_size;
    double *buffer = (double*) memalign(64, size * sizeof(double));

    for(int i = 0; i != size; ++i) buffer[i] = 0.0;
    for(int i = 0; i != private_data_size; ++i) buffer[i + private_data_size * world_rank] = world_rank * 1.0;

    bkt_allgather(buffer, private_data_size, world_rank, world_size);
    
    for(int i = 0; i != size; ++i) {
      printf("%lf ", buffer[i]);
    }
    printf("\n");
    
    free(buffer);
    
    MPI_Finalize();

    return 0;
}
