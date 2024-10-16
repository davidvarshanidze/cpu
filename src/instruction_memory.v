module instruction_memory (
    input [7:0] address,        // 8-bit address input (can access up to 256 instructions)
    output reg [31:0] instruction // 32-bit instruction output
);
    reg [31:0] memory [255:0];
    initial begin
        memory[0] = 32'b00000000000000000000000000000001;
        memory[1] = 32'b00000000000000000000000000000010;
        memory[2] = 32'b00000000000000000000000000000011;
        memory[3] = 32'b00000000000000000000000000000100;
    end

    always @(*) begin
        instruction = memory[address];
    end

endmodule
