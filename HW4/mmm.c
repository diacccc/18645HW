#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>
#include <malloc.h>

// the size of the array must be a multiple of the number of processes in each dimension
int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int r = 2;  //number of rows of processors
    int c = 2;  //number of columns of processor
    
    int M = atoi(argv[1]);  //number of rows in matrix
    int N = atoi(argv[2]);  //number of columns in matrix
    int print_processor = 0; //who prints their data.
    if (argc == 4)
      print_processor = atoi(argv[3]);
    

    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int local_m = M/r;
    int local_n = N/c;

    double *localx = (double*) memalign(64, local_n * sizeof(double));
    double *localy = (double*) memalign(64, local_m * sizeof(double));
    double *output = (double*) memalign(64, local_m * local_n * sizeof(double));


    // Create row and col communicator 

    // Create output matrix C
    for(int i = 0; i != local_m *  local_n; ++i) 
	output[i] = world_rank * 1.0;

    // Create input vector x that is distributed in a row major fashion
    // Initialize x with values from 1 to N

    // Create input vector y that is distributed in a column major fashion
    // Initialize y with values from 1 to M
    

    //Perform your distributed outer product here


    // Make sure everyone is done
    MPI_Barrier(MPI_COMM_WORLD);
    
    // only processor 0 (by default) prints its output
    if (world_rank == print_processor){
      for(int i = 0; i != local_m; ++i) {
        for(int j = 0; j != local_n; ++j) {
          printf("%lf ", output[i*local_n + j]);
        }
        printf("\n");
      }
      printf("\n");
    }
    
    free(output);
    free(localx);
    free(localy);
    
    MPI_Finalize();

    return 0;
}
