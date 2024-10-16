        .data
result: .word 0

        .text
        .globl main

main:
        # Load immediate values into registers
        li $t0, 15
        li $t1, 25

        # Perform addition
        add $t2, $t0, $t1

        # Store the result in memory
        la $t3, result
        sw $t2, 0($t3)

        # End the program
end:
        nop
