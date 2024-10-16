module control_unit (
    input [3:0] opcode,
    output reg reg_dst,
    output reg alu_src,
    output reg mem_to_reg,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg [2:0] alu_op
);

    always @(*) begin
        reg_dst    = 0;
        alu_src    = 0;
        mem_to_reg = 0;
        reg_write  = 0;
        mem_read   = 0;
        mem_write  = 0;
        branch     = 0;
        alu_op     = 3'b000;

        case (opcode)
            4'b0000: begin // ADD
                reg_dst    = 1;
                alu_src    = 0;
                reg_write  = 1;
                alu_op     = 3'b010;
            end
            4'b0001: begin // SUB
                reg_dst    = 1;
                alu_src    = 0;
                reg_write  = 1;
                alu_op     = 3'b110;
            end
            4'b0010: begin // AND
                reg_dst    = 1;
                alu_src    = 0;
                reg_write  = 1;
                alu_op     = 3'b000;
            end
            4'b0011: begin // OR
                reg_dst    = 1;
                alu_src    = 0;
                reg_write  = 1;
                alu_op     = 3'b001;
            end
            4'b0100: begin // LOAD
                alu_src    = 1;
                mem_to_reg = 1;
                reg_write  = 1;
                mem_read   = 1;
                alu_op     = 3'b010;
            end
            4'b0101: begin // STORE
                alu_src    = 1;
                mem_write  = 1;
                alu_op     = 3'b010;
            end
            4'b0110: begin // BRANCH
                branch     = 1;
                alu_op     = 3'b110; // Subtract for comparison
            end
            default: begin
                // For any unknown opcode, keep all control signals low
            end
        endcase
    end
endmodule