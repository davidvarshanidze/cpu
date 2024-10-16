        .data
result: .word 0

        .text
        .globl main

main:
        li $t0, 5
        li $t1, 5

        beq $t0, $t1, equal

        li $t2, 0
        la $t3, result
        sw $t2, 0($t3)
        j end

equal:
        li $t2, 1
        la $t3, result
        sw $t2, 0($t3)

end:
        nop
