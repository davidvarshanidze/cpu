        .data 
result: .word 0

        .text
        .globl main

main:
        li $t0, 10
        li $t1, 20

        add $t2, $t0, $t1

        la $t3, result
        sw $t2, 0($t3)

        li $t4, 25
        bgt $t2, $t4, greater

less:
        li $t5, 0
        sw $t5, 0($t3)
        j end

greater:
        li $t5, 1
        sw $t5, 0($t3)

end:
        nop
