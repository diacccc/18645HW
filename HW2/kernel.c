#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <immintrin.h>

void kernel
(
  int              m,
  int              n,
  int              k,
  double* restrict a,
  double* restrict b,
  double* restrict c
){
  
  /*
    Assume the following
        - A is stored in column major order
        - B is stored in row major order
        - C must be written out in row major order
  */
  __m256d a0, a1;
  __m256d b0, b1; 
  __m256d c00, c01, c10, c11, c20, c21, c30, c31, c40, c41;

  c00 = _mm256_load_pd(&c[0]);
  c01 = _mm256_load_pd(&c[4]);
  c10 = _mm256_load_pd(&c[n]);
  c11 = _mm256_load_pd(&c[n + 4]);
  c20 = _mm256_load_pd(&c[2 * n]);
  c21 = _mm256_load_pd(&c[2 * n + 4]);
  c30 = _mm256_load_pd(&c[3 * n]);
  c31 = _mm256_load_pd(&c[3 * n + 4]);
  c40 = _mm256_load_pd(&c[4 * n]);
  c41 = _mm256_load_pd(&c[4 * n + 4]);
  
  __asm__ volatile("look_here:"::: "memory");
  #pragma GCC unroll 2
  for (int p = 0; p != k; p++)
  {
    b0 = _mm256_load_pd(&b[p * n]);
    b1 = _mm256_load_pd(&b[p * n + 4]);
    
    a0 = _mm256_broadcast_sd(&a[p * m]);
    a1 = _mm256_broadcast_sd(&a[p * m + 1]);
    

    c00 = _mm256_fmadd_pd(a0, b0, c00);
    c01 = _mm256_fmadd_pd(a0, b1, c01);
    c10 = _mm256_fmadd_pd(a1, b0, c10);
    c11 = _mm256_fmadd_pd(a1, b1, c11);

    a0 = _mm256_broadcast_sd(&a[p * m + 2]);
    a1 = _mm256_broadcast_sd(&a[p * m + 3]);

    c20 = _mm256_fmadd_pd(a0, b0, c20);
    c21 = _mm256_fmadd_pd(a0, b1, c21);
    c30 = _mm256_fmadd_pd(a1, b0, c30);
    c31 = _mm256_fmadd_pd(a1, b1, c31);
    
    a0 = _mm256_broadcast_sd(&a[p * m + 4]);
    c40 = _mm256_fmadd_pd(a0, b0, c40);
    c41 = _mm256_fmadd_pd(a0, b1, c41);
  }
  _mm256_store_pd(&c[0], c00);
  _mm256_store_pd(&c[4], c01);
  _mm256_store_pd(&c[n], c10);
  _mm256_store_pd(&c[n + 4], c11);
  _mm256_store_pd(&c[2 * n], c20);
  _mm256_store_pd(&c[2 * n + 4], c21);
  _mm256_store_pd(&c[3 * n], c30);
  _mm256_store_pd(&c[3 * n + 4], c31);
  _mm256_store_pd(&c[4 * n], c40);
  _mm256_store_pd(&c[4 * n + 4], c41);

}
