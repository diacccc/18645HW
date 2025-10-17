#include <stdio.h>
#include <string.h>
#include <x86intrin.h>
#include <immintrin.h>

//TODO: Adjust the frequency based on your machine.
#define MAX_FREQ 3.2
#define BASE_FREQ 2.1

//TODO: Change this to reflect the number of instructions in your chain
#define NUM_INST 10000.0 


static __inline__ unsigned long long rdtsc(void) {
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

#define SIMD_ADD(a, b) \
    __asm__ volatile("vaddps %[b], %[a], %[result]" \
                     : [result] "=x" (a) \
                     : [a] "x" (a), [b] "x" (b))

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

//Hint: You may want to write Macros that call Macro intrinsics

int main(int argc, char **argv) {

  
  int runs = atoi(argv[1]);
  // You might want to use the above code to control number of runs.
  // int runs = 100;

  unsigned long long st;
  unsigned long long et;
  unsigned long long sum = 0;

  for (int j = 0; j < runs; j++) {
    __m256 a = _mm256_set1_ps(2.0f);
    __m256 b = _mm256_set1_ps(3.0f);
    
    st = rdtsc();
    __asm__ volatile("look_here:"::: "memory");
    REPEAT10000(SIMD_ADD(a, b));
    et = rdtsc();
    // Chain of NUM_INST simd add instructions
    sum += (et-st);

  }

  printf("RDTSC Base Cycles Taken for SIMD_ADD: %llu\n\r",sum);
  printf("Latency: %lf\n\r", MAX_FREQ/BASE_FREQ * sum / (NUM_INST * runs));

  return 0;
}
