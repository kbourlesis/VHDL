library ieee;
use ieee.std_logic_1164.all;

entity up_cntr_2bit_tb is
end up_cntr_2bit_tb;

architecture behavior of up_cntr_2bit_tb is

signal CLR,CLK: std_logic;
signal Q: std_logic_vector(1 downto 0);

component up_cntr_2bit port(

	clk, clr: in std_logic;
		  q: out std_logic_vector(1 downto 0)

);
end component;

begin

	up_counter1: up_cntr_2bit port map(
		
			clk => CLK,
			clr => CLR,
			  q => Q

		);

	process
	begin
	
		CLK <= '0';wait for 50 ps;
		CLK <= '1';wait for 50 ps;
		CLK <= '0';wait for 50 ps;
		CLK <= '1';wait for 50 ps;
		CLK <= '0';wait for 50 ps;
		CLK <= '1';wait for 50 ps;

	end process;

	process
	begin
	
		CLR <= '0';wait for 350 ps;
		CLR <= '1';wait for 50 ps;

	end process;

end behavior;
