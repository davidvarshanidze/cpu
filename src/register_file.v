module reg_file (
    input clk,                     // Clock signal
    input reg_write,               // Control signal: 1 to write, 0 otherwise
    input [4:0] rs,                // Source register 1 address
    input [4:0] rt,                // Source register 2 address
    input [4:0] rd,                // Destination register address
    input [31:0] write_data,       // Data to write to register
    output [31:0] reg_data1,       // Output data from source register 1
    output [31:0] reg_data2        // Output data from source register 2
);
    reg [31:0] registers [31:0];
    assign reg_data1 = registers[rs];
    assign reg_data2 = registers[rt];
    always @(posedge clk) begin
        if (reg_write) begin
            registers[rd] <= write_data;
        end
    end

    initial begin
        registers[0] = 32'd0;  // Register $zero is always 0
    end

endmodule
