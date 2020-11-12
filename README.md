# VHDL
Most of my VHDL programs are compiled using the ghdl compiler in coop with gtkwave for the simulations.

<b><u>Useful commands</u></b>

<b>Syntax analysis:</b> ghdl -s --ieee=synopsys -fexplicit name.vhd

<b>Libraries analysis:</b> ghdl -a --ieee=synopsys -fexplicit name.vhd

<b>Unit elaboration:</b> ghdl -e --ieee=synopsys -fexplicit test_entity_name

<b>Unit run:</b> ghdl -r test_entity_name --vcd=name.vcd

<b>Run simulation:</b> gtkwave name.vcd

<b><u>Other useful info</u></b>

You should append to your testbench code the following two lines, else when you run your code it will never be terminated and you will end up with a vcd file of some GBs.

assert false report "Reached end of test.";

wait;
