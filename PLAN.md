## Further plan on advancing cpu

*   Implement a Pipelined CPU
-   Pipelining improves CPU performance by overlapping instruction execution. Learn about pipeline stages (fetch, decode, execute, memory, write-back) and how to handle pipeline hazards (data hazards, control hazards).
    *   Example
    -   Modify single-cycle CPU to include a 5-stage pipeline.

*   Add Hazard Detection and Forwarding
-   Pipeline hazards occur when instructions conflict in the pipeline. Use forwarding (bypassing) and stalls to resolve these conflicts.
    *   Example
    -   Implement hazard detection logic to prevent incorrect instruction execution in a pipelined CPU.

*   Implement Cache Memory
-   Learn about memory hierarchies, caches (L1, L2), and how CPUs use caching to speed up memory access.
    *   Example
    -   Add a simple direct-mapped cache to CPU to handle memory accesses more efficiently.

*   Add Support for More Complex Instructions
-   Add instructions like mult, div, and more complex control flow instructions (e.g., j, jal, jr).
    *   Example
    -   Implement a multiply (mult) instruction in ALU.

*   Test with Real MIPS Programs
-   Run more complex assembly programs or even basic compiled C programs on CPU.
    * Example
    -   Write a MIPS assembly version of a sorting algorithm (like bubble sort) and run it on CPU.

*   Implement Multi-Cycle or Superscalar CPUs
-   Once comfortable with single-cycle and pipelined designs, explore multi-cycle CPUs, where each instruction takes multiple clock cycles.  could also explore superscalar CPUs that can issue multiple instructions per clock cycle.

*   Synthesize on FPGA (Optional)
-   Use an FPGA to implement MIPS CPU on hardware. Learn how to use Verilog HDL with tools like Xilinx Vivado or Intel Quartus.
    *   Example
    -   Synthesize MIPS CPU onto an FPGA and test it with physical inputs.

## Going further

*   Add I/O and Peripheral Support: Once we have a working CPU, we can start adding support for input/output devices or even a basic operating system.
*   Explore Parallelism: Look into multi-core CPUs or vector processors.
*   Optimize for Performance: Study performance metrics like CPI (Cycles Per Instruction) and optimize CPU.