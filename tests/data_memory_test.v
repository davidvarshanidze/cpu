`timescale 1ns / 1ps

module data_memory_tb;

    // Inputs
    reg [7:0] address;
    reg [7:0] write_data;
    reg mem_write;
    reg mem_read;

    // Outputs
    wire [7:0] read_data;

    // Instantiate the data_memory module
    data_memory uut (
        .address(address),
        .write_data(write_data),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .read_data(read_data)
    );

    initial begin
        // Initialize inputs
        address = 8'd0;
        write_data = 8'd0;
        mem_write = 0;
        mem_read = 0;

        // Test Case 1: Write data 55 to address 10
        #10;
        address = 8'd10;
        write_data = 8'd55;
        mem_write = 1;  // Enable writing
        #10;
        mem_write = 0;  // Disable writing
        
        // Test Case 2: Write data 100 to address 20
        #10;
        address = 8'd20;
        write_data = 8'd100;
        mem_write = 1;  // Enable writing
        #10;
        mem_write = 0;  // Disable writing

        // Test Case 3: Read data from address 10
        #10;
        address = 8'd10;
        mem_read = 1;  // Enable reading
        #10;
        mem_read = 0;  // Disable reading
        
        // Test Case 4: Read data from address 20
        #10;
        address = 8'd20;
        mem_read = 1;  // Enable reading
        #10;
        mem_read = 0;  // Disable reading

        // Test Case 5: Read from address 30 (should be 0 since we didn't write anything there)
        #10;
        address = 8'd30;
        mem_read = 1;  // Enable reading
        #10;
        mem_read = 0;  // Disable reading

        $stop;  // End the simulation
    end

endmodule