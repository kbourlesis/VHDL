library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is

port (
	dec2to4_in: in std_logic_vector(1 downto 0);
	dec2to4_out: out std_logic_vector(3 downto 0)
);

end dec2to4;

architecture dataflow of dec2to4 is
begin

	dec2to4_out(0) <= '1' when dec2to4_in = "00" else '0';
	dec2to4_out(1) <= '1' when dec2to4_in = "01" else '0';
	dec2to4_out(2) <= '1' when dec2to4_in = "10" else '0';
	dec2to4_out(3) <= '1' when dec2to4_in = "11" else '0';

end dataflow;
