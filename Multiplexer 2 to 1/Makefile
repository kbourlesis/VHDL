GHDL=ghdl
GHDLFLAGS=
CODE=mux2to1.vhd
TB_CODE=mux2to1_tb.vhd
UNIT=mux2to1_4bit_tb
GHDLRUNFLAGS=--vcd=

# Default target : elaborate
all: run

# Run gtkwave
gtkwave: run
	gtkwave $(UNIT).vcd

# Run UNIT
run: elaborate
	$(GHDL) -r $(UNIT) $(GHDLRUNFLAGS)$(UNIT).vcd

# Elaborate UNIT.
elaborate: analyze
	$(GHDL) -e $(UNIT)

# Targets to analyze libraries
analyze: syntax
	$(GHDL) -a $(GHDLFLAGS) $(CODE) $(TB_CODE)

# Syntax Check
syntax: force
	$(GHDL) -s $(GHDLFLAGS) $(CODE) $(TB_CODE)

force:
