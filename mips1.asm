.data             # Declare data section
num1: .word 5      # Store the number 5
num2: .word 10     # Store the number 10

.text             # Start code section
main: 
   lw $t0, num1    # Load num1 (5) into register $t0
   lw $t1, num2    # Load num2 (10) into register $t1
   add $t2, $t0, $t1  # Add $t0 and $t1, store result in $t2
   # Now $t2 holds 15