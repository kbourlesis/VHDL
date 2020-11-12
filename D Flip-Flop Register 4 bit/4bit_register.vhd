library ieee;
use ieee.std_logic_1164.all;

entity reg4 is
	port (
		D: in std_logic_vector(3 downto 0);
		Resetn, Clock: in std_logic;
		Q: out std_logic_vector(3 downto 0)
	);
end reg4;

architecture behavioral of reg4 is
begin

	process (Resetn, Clock)
	begin
		if Resetn = '0' then
			Q <= "0000";
		elsif rising_edge(Clock) then
			Q <= D;
		end if;
	end process;

end behavioral;
