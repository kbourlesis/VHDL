library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_4bit is

generic(dw : natural);

port(
	mux2to1_input1, mux2to1_input2: in std_logic_vector(dw-1 downto 0);
	  mux2to1_sel: in std_logic;
	  mux2to1_out: out std_logic_vector(dw-1 downto 0)
);

end mux2to1_4bit;

architecture dataflow of mux2to1_4bit is
begin

	mux2to1_out <= mux2to1_input1 when mux2to1_sel = '1' else mux2to1_input2;

end dataflow;
