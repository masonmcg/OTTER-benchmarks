# matadd_3x3
# adds 2 square matrices of size ARRAY_SIZE and dimention DIM_SIZE
# loops at stop_loop when done
# written for benchmarking purposes
# Author: Mason McGuire 2/1/2024

.data
  ARRAY_SIZE:  .word 9
  DIM_SIZE:    .word 3

  input1_data: .word 0, 3, 2, 0, 3, 1, 0, 3, 2 # matrix 1
  input2_data: .word 1, 1, 0, 3, 1, 2, 0, 0, 0 # matrix 2
  result:      .space 36  # 3x3 matrix

.text
start:
  # Load ARRAY_SIZE into register a1
  la a0, ARRAY_SIZE
  lw a1, 0(a0)

  # Load DIM_SIZE into register a2
  la a0, DIM_SIZE
  lw a2, 0(a0)

  # Load matrix addresses
  la a3, input1_data
  la a4, input2_data
  la s0, result

  # Call matadd function
  jal ra, matadd

stop_loop:
  # Loop to stop loop to end computation
  j stop_loop

matadd:
  li t0, 0

matadd_loop:
  bge t0, a1, matadd_done

  lw t1, 0(a3)
  lw t2, 0(a4)
  add t3, t1, t2
  sw t3, 0(s0)

  addi a3, a3, 4
  addi a4, a4, 4
  addi s0, s0, 4

  addi t0, t0, 1
  j matadd_loop

matadd_done:
  ret

