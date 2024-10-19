module mips_cpu (
    input clk,
    input reset
);
    wire [31:0] pc_out, pc_next, instruction;
    wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd;
    wire [15:0] imm;
    wire [31:0] reg_data1, reg_data2, alu_result, mem_data, write_data;
    wire [31:0] sign_ext_imm, branch_target, pc_branch;
    wire reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, zero;
    wire [2:0] alu_op;

    // Program Counter
    pc PC (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next),
        .pc_out(pc_out)
    );

    // Instruction Memory
    instruction_memory IM (
        .address(pc_out[7:0]),
        .instruction(instruction)
    );
    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign imm = instruction[15:0];
    assign funct = instruction[5:0];

    // Control Unit
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

    // Register File
    reg_file RF (
        .clk(clk),
        .reg_write(reg_write),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );
    assign sign_ext_imm = {{16{imm[15]}}, imm};

    // ALU
    alu ALU (
        .A(reg_data1),
        .B(alu_src ? sign_ext_imm : reg_data2),
        .alu_op(alu_op),
        .result(alu_result),
        .zero(zero)
    );

    // Data Memory
    data_memory DM (
        .address(alu_result),
        .write_data(reg_data2),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .read_data(mem_data)
    );

    assign branch_target = pc_out + (sign_ext_imm << 2);
    assign pc_next = branch && zero ? branch_target : pc_out + 4;

    assign write_data = mem_to_reg ? mem_data : alu_result;

endmodule
