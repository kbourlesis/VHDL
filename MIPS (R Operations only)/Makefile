GHDL=ghdl
GHDLFLAGS=--ieee=synopsys -fexplicit
CODE=mips_R.vhd ALU_32bit.vhd ALU_Control.vhd Control.vhd instruction_memory.vhd regFile_8reg_ex.vhd
TB_CODE=mips_R_tb.vhd
GHDLRUNFLAGS=--vcd=
UNIT=mips_R_tb

# Default target : run
all: run

# Run gtkwave
gtkwave: run
	gtkwave $(UNIT).vcd

# Run UNIT
run: elaborate
	$(GHDL) -r $(GHDLFLAGS) $(UNIT) $(GHDLRUNFLAGS)$(UNIT).vcd

# Elaborate UNIT.
elaborate: analyze
	$(GHDL) -e $(GHDLFLAGS) $(UNIT)

# Targets to analyze libraries
analyze: syntax
	$(GHDL) -a $(GHDLFLAGS) $(CODE) $(TB_CODE)

# Syntax Check
syntax: force
	$(GHDL) -s $(GHDLFLAGS) $(CODE) $(TB_CODE)

force:
