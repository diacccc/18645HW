#include <stdio.h>
#include <stdlib.h>

#include "transposes.h"

unsigned long long rdtsc()
{
  unsigned long long int x;
  unsigned a, d;

  __asm__ volatile("rdtsc" : "=a" (a), "=d" (d));

  return ((unsigned long long)a) | (((unsigned long long)d) << 32);
}

void morton2coor(int index, int *x, int *y){
  *x = 0; 
  *y = 0;
  for (int i = 0; i < 16; ++i) {
    *x |= ((index >> (2*i + 0)) & 1) << i;
    *y |= ((index >> (2*i + 1)) & 1) << i;
  }
}

void matrix_convert(double *src, double *dst, int N){
  for (int i = 0; i != N*N; ++i){
    int x, y;
    morton2coor(i, &x, &y);
    dst[y*N + x] = src[i];
  }
}

void transpose_naive(double *a, double *b, int N){
  for (int i = 0; i != N; ++i){
    for (int j = 0; j != N; ++j){
      b[j*N + i] = a[i*N + j];
    }
  }
}

int check(double *a, double *b, int N){
  int res = 1;
  for (int i = 0; res && i != N*N; ++i){
    int tmp = (a[i] == b[i]);
    res &= tmp;
  }
  return res;
}

int main(int argc, char** argv){
  
  double *a, *b, *c;

  int startN = 4;
  int endN = 512;

  int N = 16;  //size of matrix
  int runs = 1;

  if (argc < 4){
    printf("transpose.x <<Number of Runs>> <<Starting Size>> <<End Size>>\n");
    exit(0);
  }  
  else{
    runs = atoi(argv[1]);
    startN = atoi(argv[2]);
    endN = atoi(argv[3]);
  }


  for (int sizes = startN; sizes <= endN; sizes *= 2){
    
    int N = sizes;

    unsigned long long t0, t1;
    
    posix_memalign((void**)&a, 64, sizeof(double)*N*N);
    posix_memalign((void**)&b, 64, sizeof(double)*N*N);
    posix_memalign((void**)&c, 64, sizeof(double)*N*N);

    double *ref_a, *ref_b, *ref_c;
    posix_memalign((void**)&ref_a, 64, sizeof(double)*N*N);
    posix_memalign((void**)&ref_b, 64, sizeof(double)*N*N);
    posix_memalign((void**)&ref_c, 64, sizeof(double)*N*N);
	  
    //initialize data assuming data is row major order
    for (int i = 0; i != N; ++i){
      for (int j = 0; j != N; ++j){
	a[i*N+j] = (i+1)*1.0 + (j+1)*0.001;
	b[i] = 0.0;
      }
    }  
    
    printf("%d\t", sizes);
    
    unsigned long long sum = 0;
    int res = 0;
    
    sum = 0;
    
    for (int r = 0; r != runs; ++r){
      t0 = rdtsc();
      morton(a, b, N);   //transpose the matrix
      morton(b, c, N);   //transpose the transposed matrix
      t1 = rdtsc();
      
      sum += (t1 - t0);  
    }
    matrix_convert(a, ref_a, N);
    matrix_convert(b, ref_b, N);
    transpose_naive(ref_a, ref_c, N);
    //WARNING! PASS THIS TEST DOES NOT MEAN THE TRANSPOSE ITSELF IS CORRECT!
    res = check(ref_c, ref_b, N); //is the final matrix is the same?    
    printf("%12.3lf\t%d\t", sum/(2.0*runs), res);
    
    printf("\n");

    free(a);
    free(b);
    free(c);
  }
  
  printf("Done\n");
  
  return 0;
}
