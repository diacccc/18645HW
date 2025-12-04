compile:
	mpicc allgather_long.c -o allgather_long.x
	mpicc allgather_short.c -o allgather_short.x
	mpicc mmm.c -o mmm.x

run:
	mpiexec -n 4 ./allgather_long.x 32
	mpiexec -n 4 ./allgather_short.x 16
	mpiexec -n 4 ./mmm.x 2 2

test_split:
	mpicc mpi_row_col.c -o mpi_row_col.x
	mpiexec -n 16 ./mpi_row_col.x 8

clean:
	rm -rf *.x *.o *~ \#*\#
