        .data
value1: .word 10
value2: .word 20
result: .word 0

        .text
        .globl main

main:
        la $t0, value1
        lw $t1, 0($t0)

        la $t2, value2
        lw $t3, 0($t2)

        add $t4, $t1, $t3

        la $t5, result
        sw $t4, 0($t5)

end:
        nop
