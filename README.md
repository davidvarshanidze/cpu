## CPU

*   a model of how the CPU processes instructions, simulating the internal workings of a MIPS CPU (or similar architecture). this is more about designing the hardware logic that handles the fetch, decode, and execute stages, as well as managing registers, memory access, and other key components.

*   When I’m designing a MIPS CPU, I need to implement the hardware components using Verilog and test the CPU with MIPS assembly programs. My project is organized into two main parts: the hardware design in Verilog and the software testing using MIPS assembly.

    1. Designing the Hardware in Verilog (.v Files)
    To build the CPU, I start by defining the digital hardware components using Verilog. This includes key modules like the ALU (Arithmetic Logic Unit), Control Unit, Program Counter (PC), Register File, Instruction Memory, and Data Memory. Each of these components is written as a separate Verilog file. I also create testbenches to individually test each module to make sure they work properly before I integrate everything into the full CPU design. I keep my Verilog source files in the src directory and my testbenches in the tests directory.

    2. Writing MIPS Assembly Programs (.asm Files)
    After the CPU hardware is designed, I write MIPS assembly programs to test it. These .asm files contain simple MIPS instructions that my CPU will fetch, decode, and execute. For example, I might write a program that adds two numbers or accesses memory. By running these assembly programs on my CPU, I can check if it’s processing the instructions correctly. I store these test programs in a programs directory, and use them to verify that my CPU works as expected.