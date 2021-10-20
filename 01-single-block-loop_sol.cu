#include <stdio.h>

/*
 * Refactor `loop` to be a CUDA Kernel. The new kernel should
 * only do the work of 1 iteration of the original loop.
 */

__global__ void loop()
{
  /*
   * This kernel does the work of only 1 iteration
   * of the original for loop. Indication of which
   * "iteration" is being executed by this kernel is
   * still available via `threadIdx.x`.
   */

  printf("This is iteration number %d\n", threadIdx.x);
}

int main()
{
  /*
   * When refactoring `loop` to launch as a kernel, be sure
   * to use the execution configuration to control how many
   * "iterations" to perform.
   *
   * For this exercise, only use 1 block of threads.
   */
  loop<<<1, 10>>>();
  cudaDeviceSynchronize();
}
