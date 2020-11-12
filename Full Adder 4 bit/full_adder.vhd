library ieee;
use ieee.std_logic_1164.all;

entity full_adder is port(

	a,b,Cin: in std_logic;
	 s,Cout: out std_logic

);
end full_adder;

architecture behavior of full_adder is

begin

	s <= (a xor b) xor Cin;
	Cout <= (a and b) or ((a xor b) and Cin);

end behavior;