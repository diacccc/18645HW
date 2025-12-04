#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <limits.h>

// the first argument to the main function specifies how many processes are in the row

int main(int argc, char** argv) {
    // initialize MPI
    MPI_Init(&argc, &argv);

    int row_elements = atoi(argv[1]);
    
    int world_size, world_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int row_color = world_rank / row_elements;
    int col_color = world_rank % row_elements;

    //create row and column communicator based on colors
    //processors who are of the same color are grouped together

    //processors 0 to row_elements-1 are in the same row.
    //processors that are multiples of row_elements are in the same column.
    MPI_Comm row_comm, col_comm;
    MPI_Comm_split(MPI_COMM_WORLD, row_color, world_rank, &row_comm);
    MPI_Comm_split(MPI_COMM_WORLD, col_color, world_rank, &col_comm);

    //find out row and column rank and sizes;
    int row_rank, row_size, col_rank, col_size;
    MPI_Comm_rank(row_comm, &row_rank);
    MPI_Comm_size(row_comm, &row_size);
    MPI_Comm_rank(col_comm, &col_rank);
    MPI_Comm_size(col_comm, &col_size);

    printf("World Rank/Size: %d/%d\t Row Rank/Size: %d/%d\t Col Rank/Size: %d/%d\n", world_rank, world_size, row_rank, row_size, col_rank, col_size);

    MPI_Comm_free(&row_comm);
    MPI_Comm_free(&col_comm);
    
    //clean up code for MPI   
    MPI_Finalize();
}
