#include <stdio.h>
#include <string.h>
#include <x86intrin.h>
#include <immintrin.h>

//TODO: Adjust the frequency based on your machine.
#define MAX_FREQ 3.2
#define BASE_FREQ 2.1

//TODO: Change number of instructions to reflect your chains
#define NUM_INST 1000.0
//TODO: Change to reflect number of independent chains
#define NUM_CHAINS 8

static __inline__ unsigned long long rdtsc(void) {
  unsigned hi, lo;
  __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
  return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

#define SIMD_ADD \
    __asm__ volatile("vaddps %%ymm0, %%ymm1, %%ymm1\n\t" \
                      "vaddps %%ymm0, %%ymm2, %%ymm2\n\t" \
                      "vaddps %%ymm0, %%ymm3, %%ymm3\n\t" \
                      "vaddps %%ymm0, %%ymm4, %%ymm4\n\t" \
                      "vaddps %%ymm0, %%ymm5, %%ymm5\n\t" \
                      "vaddps %%ymm0, %%ymm6, %%ymm6\n\t" \
                      "vaddps %%ymm0, %%ymm7, %%ymm7\n\t" \
                      "vaddps %%ymm0, %%ymm8, %%ymm8\n\t" \
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


void print_cpu_frequency() {
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) {
        perror("Failed to open /proc/cpuinfo");
        return;
    }
    
    char line[256];
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "cpu MHz")) {
            printf("%s", line);
            break;  // Print only first CPU frequency
        }
    }
    fclose(fp);
}
//TODO: Define your Macros here

int main(int argc, char **argv) {

  int runs = atoi(argv[1]);
  // You might want to use the above code to control number of runs.
  // int runs = 1000;

  unsigned long long st;
  unsigned long long et;
  unsigned long long sum = 0;

  for (int j = 0; j < runs; j++) {
    __asm__ volatile(
        "vbroadcastss %[val2], %%ymm0\n\t"
        "vbroadcastss %[val3], %%ymm1\n\t"
        "vbroadcastss %[val3], %%ymm2\n\t"
        "vbroadcastss %[val3], %%ymm3\n\t"
        "vbroadcastss %[val3], %%ymm4\n\t"
        "vbroadcastss %[val3], %%ymm5\n\t"
        "vbroadcastss %[val3], %%ymm6\n\t"
        "vbroadcastss %[val3], %%ymm7\n\t"
        "vbroadcastss %[val3], %%ymm8\n\t"
        "vbroadcastss %[val3], %%ymm9\n\t"
        "vbroadcastss %[val3], %%ymm10\n\t"
        "vbroadcastss %[val3], %%ymm11\n\t"
        "vbroadcastss %[val3], %%ymm12\n\t"
        "vbroadcastss %[val3], %%ymm13\n\t"
        "vbroadcastss %[val3], %%ymm14\n\t"
        "vbroadcastss %[val3], %%ymm15\n\t"
        :
        : [val2] "m" (*(float[]){2.0f}),
          [val3] "m" (*(float[]){3.0f})
        : "ymm0", "ymm1"
    );

    __asm__ volatile("look_here:"::: "memory");
    // Time the add
    st = rdtsc();
    REPEAT1000(SIMD_ADD);
    et = rdtsc();

    sum += (et-st);

  }

  printf("RDTSC Base Cycles Taken for SIMD_ADD: %llu\n\r",sum);
  printf("TURBO Cycles Taken for SIMD_ADD: %lf\n\r",sum * ((double)MAX_FREQ)/BASE_FREQ);
  printf("Throughput : %lf \n\r",((double)NUM_INST * runs * NUM_CHAINS) / (sum * MAX_FREQ/BASE_FREQ));

return 0;
}
