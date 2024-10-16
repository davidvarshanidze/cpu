module data_memory (
    input [31:0] address,
    input [31:0] write_data,
    input mem_write,
    input mem_read,
    output reg [31:0] read_data
);

    reg [31:0] memory [255:0];  // Memory array (can store 256 words)

    always @(posedge mem_write) begin
        if (mem_write) begin
            memory[address] <= write_data;
        end
    end

    always @(posedge mem_read) begin
        if (mem_read) begin
            read_data <= memory[address];
        end
    end

endmodule