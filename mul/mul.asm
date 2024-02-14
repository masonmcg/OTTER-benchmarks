# mul
# multiplies 2 numbers together
# loops at stop_loop when done
# written for benchmarking purposes
# Author: Mason McGuire 2/1/2024

.data
  num1:   .word 5
  num2:   .word 7
  result: .word 0

.text
start:
  # Load num1 into register a0
  la a0, num1         
  lw a0, 0(a0)        
  
  # Load num2 into register a0
  la a1, num2
  lw a1, 0(a1)

  # Call the multiplication function
  jal mul
  
  # Save result in memory at location result
  la a4, result
  sw a3, 0(a4)

stop_loop:
  # Infinite loop indicates end of program
  j stop_loop

mul:
  # Initialize the accumulator to 0
  li a3, 0

  # Loop to iterate through multiplier (num1)
  loop:
    # Decrement multiplier (num1)
    addi a0, a0, -1

    # Add multiplicand (num2) to accumulator
    add a3, a3, a1

    # Check if multiplier (num1) is 0, if not continue looping
    bnez a0, loop

  # Return from the function
  ret