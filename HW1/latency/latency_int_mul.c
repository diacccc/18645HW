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


//TODO: define your macros here
#define MUL(a, b) \
    __asm__ volatile("imull %[b], %[a]" \
                     : [a] "=r" (a)   \
                     : "[a]" (a), [b] "r" (b))


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
    int a = 1, b = 1;
    st = rdtsc();
    __asm__ volatile("look_here:"::: "memory");
    REPEAT10000(MUL(a, b));
    et = rdtsc();
    // Chain of NUM_INST simd add instructions
    sum += (et-st);

  }

  printf("RDTSC Base Cycles Taken for SCALAR_INT_MUL: %llu\n\r",sum);
  printf("Latency: %lf\n\r", MAX_FREQ/BASE_FREQ * sum / (NUM_INST * runs));

  return 0;
}
