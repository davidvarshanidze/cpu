        .data
result1: .word 0
result2: .word 0
result3: .word 0

        .text
        .globl main

main:
        li $t0, 10
        li $t1, 20
        li $t2, 30
        li $t3, 0

        add $t4, $t0, $t1
        sub $t5, $t4, $t2

        bgt $t5, $zero, greater
        j end

greater:
        addi $t3, $t3, 1

end1:
        la $t6, result1
        sw $t4, 0($t6)

        la $t7, result2
        sw $t5, 0($t7)

        la $t8, result3
        sw $t3, 0($t8)

end:
        nop
