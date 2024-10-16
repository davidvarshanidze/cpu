module data_memory (
    input [7:0] address,      // 8-bit address input
    input [7:0] write_data,   // Data to be written to memory
    input mem_write,          // Control signal: 1 to write, 0 otherwise
    input mem_read,           // Control signal: 1 to read, 0 otherwise
    output reg [7:0] read_data // Data output from memory
);

    // Declare memory array with 256 8-bit entries
    reg [7:0] memory [255:0];

    always @(*) begin
        if (mem_read) begin
            read_data = memory[address];  // Read from memory
        end else begin
            read_data = 8'b0;  // Default value if not reading
        end
    end

    always @(posedge mem_write) begin
        if (mem_write) begin
            memory[address] = write_data;  // Write to memory
        end
    end

endmodule