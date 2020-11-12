library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity up_cntr_2bit is port(

	clr,clk: in std_logic;
	      q: out std_logic_vector(1 downto 0)

);
end up_cntr_2bit;

architecture behavior of up_cntr_2bit is

signal count: std_logic_vector(1 downto 0) := "00";

begin

	process(clk,clr)
	begin
		if(clr = '1') then
			count <= "00";
		end if;

		if(count = "11") then
			count <= "00";
		end if;

		if(rising_edge(clk) and clr = '0') then
			count <= count + 1;
		end if;
	end process;

	q <= count;

end behavior;