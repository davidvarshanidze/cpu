```bash
/cpu
├── /src
│   ├── alu.v                     # ALU module (Verilog)
│   ├── control_unit.v            # Control unit module (Verilog)
│   ├── data_memory.v             # Data memory module (Verilog)
│   ├── instruction_memory.v      # Instruction memory module (Verilog)
│   ├── pc.v                      # Program Counter module (Verilog)
│   ├── register_file.v           # Register file module (Verilog)
│   └── mips_cpu.v                # Top-level CPU module (Verilog)
├── /tests
│   ├── alu_test.v                # ALU testbench (Verilog)
│   ├── control_unit_test.v       # Control unit testbench (Verilog)
│   ├── data_memory_test.v        # Data memory testbench (Verilog)
│   ├── instruction_memory_test.v # Instruction memory testbench (Verilog)
│   ├── mips_cpu_test.v           # Top-level CPU testbench (Verilog)
│   └── program.asm               # MIPS assembly program to test CPU
├── /programs
│   ├── test_add.asm              # MIPS assembly test program (addition)
│   ├── test_lw_sw.asm            # MIPS assembly test program (load/store)
│   ├── test_beq.asm              # MIPS assembly test program (branching)
│   └── test_complex.asm          # More complex MIPS assembly program
├── Makefile                      # Build and simulation instructions
└── README.md                     # Documentation
```