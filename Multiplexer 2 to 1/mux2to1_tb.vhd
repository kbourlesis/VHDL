library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_4bit_tb is
	generic(DW : natural := 4);
end mux2to1_4bit_tb;

architecture dataflow of mux2to1_4bit_tb is

signal MUX2TO1_INPUT1,MUX2TO1_INPUT2,MUX2TO1_OUT: std_logic_vector (DW-1 downto 0);
signal     													 MUX2TO1_SEL: std_logic;

component mux2to1_4bit

generic(dw : natural);

port(

	mux2to1_input1, mux2to1_input2: in std_logic_vector(dw-1 downto 0);
									   mux2to1_sel: in std_logic;
									   mux2to1_out: out std_logic_vector(dw-1 downto 0)

);
end component;

begin

M1_4bit: mux2to1_4bit

generic map(
	dw => DW
)

port map(

	mux2to1_input1 => MUX2TO1_INPUT1,
	mux2to1_input2 => MUX2TO1_INPUT2,
	mux2to1_sel => MUX2TO1_SEL,
	mux2to1_out => MUX2TO1_OUT

);

process
begin

	MUX2TO1_INPUT1 <= "XXXX";
	MUX2TO1_INPUT2 <= "XXXX";
	MUX2TO1_SEL <= 'X';
	wait for 50 ns;

	MUX2TO1_INPUT1 <= "0000";
	MUX2TO1_INPUT2 <= "1101";
	MUX2TO1_SEL <= '0';
	wait for 50 ns;

	MUX2TO1_INPUT1 <= "0000";
	MUX2TO1_INPUT2 <= "1101";
	MUX2TO1_SEL <= '1';
	wait for 50 ns;

	assert false report "Reached end of test.";
	wait;

end process;

end dataflow;
