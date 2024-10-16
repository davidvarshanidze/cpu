# Define variables
VERILOG_SOURCES = src/alu.v src/control_unit.v src/data_memory.v src/instruction_memory.v src/pc.v src/register_file.v src/mips_cpu.v
ASSEMBLY_SOURCES = program.asm test_add.asm test_beq.asm test_complex.asm test_lw_sw.asm
OUTPUT_VLOG = mips_cpu_sim
OUTPUT_ASM = assembled_program

# Targets
all: $(OUTPUT_VLOG) $(OUTPUT_ASM)

# Compile Verilog Modules
$(OUTPUT_VLOG): $(VERILOG_SOURCES)
	iverilog -o $(OUTPUT_VLOG) $(VERILOG_SOURCES)

# Assemble MIPS Programs
$(OUTPUT_ASM): $(ASSEMBLY_SOURCES)
	spim -file $(ASSEMBLY_SOURCES)

# Clean up build files
clean:
	rm -f $(OUTPUT_VLOG) $(OUTPUT_ASM) *.o *.vvp

.PHONY: all clean
