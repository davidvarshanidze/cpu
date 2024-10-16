module tb_control_unit;
    reg [3:0] opcode;
    wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch;
    wire [2:0] alu_op;

    control_unit CU (
        .opcode(opcode),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .alu_op(alu_op)
    );

    initial begin
        opcode = 4'b0000; // ADD
        #10;
        $display("ADD -> reg_dst: %b, alu_op: %b, reg_write: %b", reg_dst, alu_op, reg_write);

        opcode = 4'b0001; // SUB
        #10;
        $display("SUB -> reg_dst: %b, alu_op: %b, reg_write: %b", reg_dst, alu_op, reg_write);

        opcode = 4'b0010; // AND
        #10;
        $display("AND -> reg_dst: %b, alu_op: %b, reg_write: %b", reg_dst, alu_op, reg_write);

        opcode = 4'b0011; // OR
        #10;
        $display("OR -> reg_dst: %b, alu_op: %b, reg_write: %b", reg_dst, alu_op, reg_write);

        opcode = 4'b0100; // LOAD
        #10;
        $display("LOAD -> alu_src: %b, mem_to_reg: %b, reg_write: %b, mem_read: %b", alu_src, mem_to_reg, reg_write, mem_read);

        opcode = 4'b0101; // STORE
        #10;
        $display("STORE -> alu_src: %b, mem_write: %b", alu_src, mem_write);

        opcode = 4'b0110; // BRANCH
        #10;
        $display("BRANCH -> branch: %b, alu_op: %b", branch, alu_op);

        $finish;
    end
endmodule
