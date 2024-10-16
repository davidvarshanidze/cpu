VERILOG_SOURCES = src/alu.v src/control_unit.v src/data_memory.v src/instruction_memory.v src/pc.v src/register_file.v src/mips_cpu.v
ASSEMBLY_SOURCES = test/program.asm programs/test_add.asm programs/test_beq.asm programs/test_complex.asm programs/test_lw_sw.asm
OUTPUT_VLOG = mips_cpu_sim
OUTPUT_ASM = assembled_program

all: $(OUTPUT_VLOG) $(OUTPUT_ASM)

$(OUTPUT_VLOG): $(VERILOG_SOURCES)
	iverilog -o $(OUTPUT_VLOG) $(VERILOG_SOURCES)

$(OUTPUT_ASM): $(ASSEMBLY_SOURCES)
	spim -file $(ASSEMBLY_SOURCES)

clean:
	rm -f $(OUTPUT_VLOG) $(OUTPUT_ASM) *.o *.vvp

.PHONY: all clean
