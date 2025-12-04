#include <immintrin.h>

// pack a row major order matrix (mc x k) into 
// (mc / m) panels that are each (m x k), and column major order
void pack(double* pack_a, double* a, int mc, int m, int k)
{
    double* dst = pack_a;
    double* src = a;
    // pack each m x k panel
    for (int i = 0; i != mc / m; ++i) {
        // for each 6x4 block 
        for (int j = 0; j != k; j += 4) {
            __m256d row0 = _mm256_loadu_pd(&src[(0 + i * m) * k + j]); // a00 a01 a02 a03
            __m256d row1 = _mm256_loadu_pd(&src[(1 + i * m) * k + j]); // a10 a11 a12 a13
            __m256d row2 = _mm256_loadu_pd(&src[(2 + i * m) * k + j]); // a20 a21 a22 a23
            __m256d row3 = _mm256_loadu_pd(&src[(3 + i * m) * k + j]); // a30 a31 a32 a33
            __m256d row4 = _mm256_loadu_pd(&src[(4 + i * m) * k + j]); // a40 a41 a42 a43
            __m256d row5 = _mm256_loadu_pd(&src[(5 + i * m) * k + j]); // a50 a51 a52 a53

            __m256d t0 = _mm256_unpacklo_pd(row0, row1); // a00 a10 a02 a12
            __m256d t1 = _mm256_unpackhi_pd(row0, row1); // a01 a11 a03 a13
            __m256d t2 = _mm256_unpacklo_pd(row2, row3); // a20 a30 a22 a32
            __m256d t3 = _mm256_unpackhi_pd(row2, row3); // a21 a31 a23 a33
            __m256d t4 = _mm256_unpacklo_pd(row4, row5); // a40 a50 a42 a52
            __m256d t5 = _mm256_unpackhi_pd(row4, row5); // a41 a51 a43 a53

            row0 = _mm256_permute2f128_pd(t0, t2, 0x20); // a00 a10 a20 a30
            row1 = _mm256_permute2f128_pd(t4, t1, 0x20); // a40 a50 a01 a11
            row2 = _mm256_permute2f128_pd(t3, t5, 0x20); // a21 a31 a41 a51
            row3 = _mm256_permute2f128_pd(t0, t2, 0x31); // a02 a12 a22 a32
            row4 = _mm256_permute2f128_pd(t4, t1, 0x31); // a42 a52 a03 a13
            row5 = _mm256_permute2f128_pd(t3, t5, 0x31); // a23 a33 a43 a53

            _mm256_storeu_pd(&dst[0], row0);
            _mm256_storeu_pd(&dst[4], row1);
            _mm256_storeu_pd(&dst[8], row2);
            _mm256_storeu_pd(&dst[12], row3);
            _mm256_storeu_pd(&dst[16], row4);
            _mm256_storeu_pd(&dst[20], row5);
            dst += 24;
        }
    }
}