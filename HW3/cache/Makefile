CC = gcc
CFLAGS = -O3 -std=c99 -march=native -mavx

OBJS = morton.o 

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

compile: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) driver.c  -o transpose.x -march=native

run:
	./transpose.x
	./transpose.x 1000  4 4

clean:
	rm -f *.x *~ *.o