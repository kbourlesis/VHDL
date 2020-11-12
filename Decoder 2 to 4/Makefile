GHDL=ghdl
GHDLFLAGS=
CODE=dec2to4.vhd
TB_CODE=dec2to4_tb.vhd
GHDLRUNFLAGS=--vcd=
UNIT=dec2to4_tb

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
