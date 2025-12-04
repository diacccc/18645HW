#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int size = atoi(argv[1]);
    
    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int psize = size / world_size;
    double *global = (double*) memalign(64, size * sizeof(double));
    double *temp = (double*) memalign(64, psize * sizeof(double));

    for(int i = 0; i != size; ++i) global[i] = 0.0;
    for(int i = 0; i != psize; ++i) temp[i] = world_rank * 1.0;

    // write your code here - should be about than two lines

    
    
    for(int i = 0; i != size; ++i) {
      printf("%lf ", global[i]);
    }
    printf("\n");
    
    free(global);
    
    MPI_Finalize();

    return 0;
}
