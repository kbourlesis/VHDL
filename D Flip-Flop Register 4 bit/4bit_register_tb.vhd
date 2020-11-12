library ieee;
use ieee.std_logic_1164.all;

entity reg4_tb is
end reg4_tb;

architecture behavior of reg4_tb is

signal d,q: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal resetn,clk: STD_LOGIC;

component reg4
	port (
		D: in std_logic_vector(3 downto 0);
		Resetn, Clock: in std_logic;
		Q: out std_logic_vector(3 downto 0)
	);
end component;

begin

	reg4_1: reg4 port map(
				D => d,
				Q => q,
				Resetn => resetn,
				Clock => clk
			);

	process
	begin

		resetn <= '0';
		d <= "0010";
		clk <= '1';
		wait for 100 ns;

		clk <= '0';
		wait for 100 ns;

		resetn <= '1';
		d <= "0010";
		clk <= '1';
		wait for 100 ns;

		clk <= '0';
		wait for 100 ns;

		d <= "1110";
		clk <= '1';
		wait for 100 ns;

		clk <= '0';
		wait for 100 ns;

		d <= "1010";
		clk <= '1';
		wait for 100 ns;

		resetn <= '0';
		wait for 100 ns;

		assert false report "Reached end of test";
		wait;

	end process;

end behavior;
