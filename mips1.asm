# Example of simulating instruction fetch
lw $t0, 0($pc)   # Load the instruction at the PC into $t0
addi $pc, $pc, 4  # Increment the program counter to the next instruction

# Simulate decode phase by branching based on instruction type
beq $t0, add_op, handle_add  # If instruction is an add, go to handle_add
beq $t0, lw_op, handle_load  # If instruction is a load, go to handle_load
# Continue with other operations

handle_add:
    add $t1, $t2, $t3  # Perform the add operation
    j fetch_next       # Jump back to fetch the next instruction

handle_load:
    lw $t1, 0($t2)     # Perform the load operation
    j fetch_next       # Jump back to fetch the next instruction
    