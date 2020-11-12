library ieee;
use ieee.std_logic_1164.all;

entity fa_4bit_test is
end fa_4bit_test;

architecture behavior of fa_4bit_test is

signal x,y,s: std_logic_vector(3 downto 0);
signal CIN,COUT: std_logic;

component fa_4bit port(

	 X,Y: in std_logic_vector(3 downto 0);
	   S: out std_logic_vector(3 downto 0);
	Cout: out std_logic;
	 Cin: in std_logic

);
end component;

begin

FA_4b: fa_4bit port map(

	X => x,
	Y => y,
	S => s,
	Cin => CIN,
	Cout => COUT

);

process
begin

x <= "0000";
y <= "0000";
CIN <= '0';
wait for 100 ps;

x <= "1111";
y <= "1111";
CIN <= '0';
wait for 100 ps;

x <= "1111";
y <= "1111";
CIN <= '1';
wait for 100 ps;

end process;

end behavior;