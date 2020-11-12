library ieee;
use ieee.std_logic_1164.all;

entity dec2to4_tb is
end dec2to4_tb;

architecture arch_test of dec2to4_tb is

signal DEC2TO4_IN: std_logic_vector(1 downto 0);
signal DEC2TO4_OUT: std_logic_vector(3 downto 0);

component dec2to4 port(

	dec2to4_in: in std_logic_vector(1 downto 0);
	dec2to4_out: out std_logic_vector(3 downto 0)

);
end component;

begin

D1: dec2to4 port map(

	dec2to4_in => DEC2TO4_IN,
	dec2to4_out => DEC2TO4_OUT

);

process
begin

DEC2TO4_IN <= "XX";
wait for 100 ps;

DEC2TO4_IN <= "00";
wait for 100 ps;

DEC2TO4_IN <= "01";
wait for 100 ps;

DEC2TO4_IN <= "10";
wait for 100 ps;

DEC2TO4_IN <= "11";
wait for 100 ps;

assert false report "Reached end of test.";
wait;

end process;

end arch_test;
