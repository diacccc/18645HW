#include "stdlib.h"
#include "transposes.h"
#include <immintrin.h>

inline void transpose_8x8(double *a, double *b) {
    __m256d ymm0 = _mm256_loadu_pd(&a[0]);   // a00 a01 a10 a11
    __m256d ymm1 = _mm256_loadu_pd(&a[4]);   // a02 a03 a12 a13
    __m256d ymm2 = _mm256_loadu_pd(&a[8]);   // a20 a21 a30 a31
    __m256d ymm3 = _mm256_loadu_pd(&a[12]);  // a22 a23 a32 a33

    __m256d ymm4 = _mm256_loadu_pd(&a[16]);  // a04 a05 a14 a15
    __m256d ymm5 = _mm256_loadu_pd(&a[20]);  // a06 a07 a16 a17
    __m256d ymm6 = _mm256_loadu_pd(&a[24]);  // a24 a25 a34 a35
    __m256d ymm7 = _mm256_loadu_pd(&a[28]);  // a26 a27 a36 a37
    
    __m256d ymm8 = _mm256_loadu_pd(&a[32]);  // a40 a41 a50 a51
    __m256d ymm9 = _mm256_loadu_pd(&a[36]);  // a42 a43 a52 a53
    __m256d ymm10 = _mm256_loadu_pd(&a[40]); // a60 a61 a70 a71
    __m256d ymm11 = _mm256_loadu_pd(&a[44]); // a62 a63 a72 a73
    
    __m256d ymm12 = _mm256_loadu_pd(&a[48]); // a04 a05 a14 a15
    __m256d ymm13 = _mm256_loadu_pd(&a[52]); // a06 a07 a16 a17
    __m256d ymm14 = _mm256_loadu_pd(&a[56]); // a24 a25 a34 a35
    __m256d ymm15 = _mm256_loadu_pd(&a[60]); // a26 a27 a36 a37

    ymm0 = _mm256_permute4x64_pd(ymm0, 0xD8);
    ymm1 = _mm256_permute4x64_pd(ymm1, 0xD8);
    ymm2 = _mm256_permute4x64_pd(ymm2, 0xD8);
    ymm3 = _mm256_permute4x64_pd(ymm3, 0xD8);
    ymm4 = _mm256_permute4x64_pd(ymm4, 0xD8);
    ymm5 = _mm256_permute4x64_pd(ymm5, 0xD8);
    ymm6 = _mm256_permute4x64_pd(ymm6, 0xD8);
    ymm7 = _mm256_permute4x64_pd(ymm7, 0xD8);
    ymm8 = _mm256_permute4x64_pd(ymm8, 0xD8);
    ymm9 = _mm256_permute4x64_pd(ymm9, 0xD8);
    ymm10 = _mm256_permute4x64_pd(ymm10, 0xD8);
    ymm11 = _mm256_permute4x64_pd(ymm11, 0xD8);
    ymm12 = _mm256_permute4x64_pd(ymm12, 0xD8);
    ymm13 = _mm256_permute4x64_pd(ymm13, 0xD8);
    ymm14 = _mm256_permute4x64_pd(ymm14, 0xD8);
    ymm15 = _mm256_permute4x64_pd(ymm15, 0xD8);

    _mm256_storeu_pd(&b[0], ymm0);
    _mm256_storeu_pd(&b[4], ymm2);
    _mm256_storeu_pd(&b[8], ymm1);
    _mm256_storeu_pd(&b[12], ymm3);
    _mm256_storeu_pd(&b[16], ymm8);
    _mm256_storeu_pd(&b[20], ymm10);
    _mm256_storeu_pd(&b[24], ymm9);
    _mm256_storeu_pd(&b[28], ymm11);
    _mm256_storeu_pd(&b[32], ymm4);
    _mm256_storeu_pd(&b[36], ymm6);
    _mm256_storeu_pd(&b[40], ymm5);
    _mm256_storeu_pd(&b[44], ymm7);
    _mm256_storeu_pd(&b[48], ymm12);
    _mm256_storeu_pd(&b[52], ymm14);
    _mm256_storeu_pd(&b[56], ymm13);
    _mm256_storeu_pd(&b[60], ymm15);
}


void morton(double *a, double *b, int N) {
    if (N == 8) {
        transpose_8x8(a, b);
        return;
    }

    int half = N / 2; 
    int quad_size = half * half;
    
    morton(a, b, half);

    morton(a + quad_size, b + 2 * quad_size, half);

    morton(a + 2 * quad_size, b + quad_size, half);
    
    morton(a + 3 * quad_size, b + 3 * quad_size, half);
}