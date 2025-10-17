#include <stdio.h>
#include <string.h>
#include <x86intrin.h>
#include <immintrin.h>

#define MAX_FREQ 3.2
#define BASE_FREQ 2.1
#define NUM_INST 1000.0
#define NUM_CHAINS 8

static __inline__ unsigned long long rdtsc(void) {
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

#define SIMD_FMA \
    __asm__ volatile("vfmadd231ps %%ymm0, %%ymm1, %%ymm2\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm3\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm4\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm5\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm6\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm7\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm8\n\t" \
                      "vfmadd231ps %%ymm0, %%ymm1, %%ymm9\n\t" \
                     ::: "ymm0", "ymm1", "ymm2", "ymm3", "ymm4", "ymm5", "ymm6", "ymm7", "ymm8", "ymm9", "ymm10", "ymm11", "ymm12", "ymm13", "ymm14", "ymm15")


#define REPEAT10(macro) \
  macro; macro; macro; macro; macro; \
  macro; macro; macro; macro; macro;

#define REPEAT100(macro) \
  REPEAT10(macro); REPEAT10(macro); REPEAT10(macro); REPEAT10(macro); REPEAT10(macro); \
  REPEAT10(macro); REPEAT10(macro); REPEAT10(macro); REPEAT10(macro); REPEAT10(macro);

#define REPEAT1000(macro) \
  REPEAT100(macro); REPEAT100(macro); REPEAT100(macro); REPEAT100(macro); REPEAT100(macro); \
  REPEAT100(macro); REPEAT100(macro); REPEAT100(macro); REPEAT100(macro); REPEAT100(macro);

#define REPEAT10000(macro) \
  REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro); \
  REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro); REPEAT1000(macro);



//TODO: Define your Macros here

int main(int argc, char **argv) {


  int runs = atoi(argv[1]);
  // You might want to use the above code to control number of runs.
  // int runs = 100;

  unsigned long long st;
  unsigned long long et;
  unsigned long long sum = 0;

  for (int j = 0; j < runs; j++) {
    __asm__ volatile(
        "vbroadcastss %[val2], %%ymm0\n\t"
        "vbroadcastss %[val3], %%ymm1\n\t"
        "vbroadcastss %[val4], %%ymm2\n\t"
        "vbroadcastss %[val4], %%ymm3\n\t"
        "vbroadcastss %[val4], %%ymm4\n\t"
        "vbroadcastss %[val4], %%ymm5\n\t"
        "vbroadcastss %[val4], %%ymm6\n\t"
        "vbroadcastss %[val4], %%ymm7\n\t"
        "vbroadcastss %[val4], %%ymm8\n\t"
        "vbroadcastss %[val4], %%ymm9\n\t"
        "vbroadcastss %[val4], %%ymm10\n\t"
        "vbroadcastss %[val4], %%ymm11\n\t"
        "vbroadcastss %[val4], %%ymm12\n\t"
        "vbroadcastss %[val4], %%ymm13\n\t"
        "vbroadcastss %[val4], %%ymm14\n\t"
        "vbroadcastss %[val4], %%ymm15"
        :
        : [val2] "m" (*(float[]){2.0f}),
          [val3] "m" (*(float[]){3.0f}),
          [val4] "m" (*(float[]){4.0f})
        : "memory", "ymm0", "ymm1", "ymm2", "ymm3", "ymm4", "ymm5", "ymm6", "ymm7", "ymm8", "ymm9", "ymm10", "ymm11", "ymm12", "ymm13", "ymm14", "ymm15"
    );
    __asm__ volatile("look_here:"::: "memory");
    // Time the add
    st = rdtsc();
    REPEAT1000(SIMD_FMA);
    et = rdtsc();

    sum += (et-st);

  }

  printf("RDTSC Base Cycles Taken for SIMD_FMA: %llu\n\r",sum);
  printf("TURBO Cycles Taken for SIMD_FMA: %lf\n\r",sum * ((double)MAX_FREQ)/BASE_FREQ);
  printf("Throughput : %lf\n\r",(double)(NUM_INST * runs * NUM_CHAINS) / (sum * MAX_FREQ/BASE_FREQ));

return 0;
}
