        .data                   # Data segment
result: .word 0                 # Memory location to store result

        .text                   # Code segment
        .globl main             # Declare main as global to start execution here

main:
        # Load immediate values into registers
        li $t0, 10              # Load 10 into register $t0
        li $t1, 20              # Load 20 into register $t1

        # Perform addition
        add $t2, $t0, $t1       # $t2 = $t0 + $t1 (t2 = 10 + 20 = 30)

        # Store the result in memory
        la $t3, result          # Load the address of the result variable into $t3
        sw $t2, 0($t3)          # Store the value of $t2 (30) into memory at result

        # Perform a conditional branch (check if $t2 > 25)
        li $t4, 25              # Load 25 into register $t4
        bgt $t2, $t4, greater   # If $t2 > $t4, branch to label "greater"

less:
        # If $t2 <= 25, store 0 in result and halt
        li $t5, 0               # Load 0 into $t5
        sw $t5, 0($t3)          # Store 0 in result
        j end                   # Jump to end

greater:
        # If $t2 > 25, store 1 in result and halt
        li $t5, 1               # Load 1 into $t5
        sw $t5, 0($t3)          # Store 1 in result

end:
        nop                     # No operation (program end)
