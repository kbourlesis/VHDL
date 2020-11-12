GHDL=ghdl
GHDLFLAGS=--ieee=synopsys
CODE=4bit_register.vhd
TB_CODE=4bit_register_tb.vhd
GHDLRUNFLAGS=--vcd=
UNIT=reg4_tb

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
