library ieee;
use ieee.std_logic_1164.all;

entity fa_4bit is

	port(
		Cin: in std_logic;
		X,Y: in std_logic_vector(3 downto 0);
		  S: out std_logic_vector(3 downto 0);
		Cout: out std_logic
	);

end fa_4bit;


architecture behavior of fa_4bit is

signal c1,c2,c3: std_logic;

component full_adder port(
		a,b,Cin: in std_logic;
		s,Cout: out std_logic
	);
end component;

begin

	FA: full_adder port map(
			a => X(0),
			b => Y(0),
			Cin => Cin,
			s => S(0),
			Cout => c1
		);

	FA2: full_adder port map(
			a => X(1),
			b => Y(1),
			Cin => c1,
			s => S(1),
			Cout => c2
		);

	FA3: full_adder port map(
			a => X(2),
			b => Y(2),
			Cin => c2,
			s => S(2),
			Cout => c3
		);

	FA4: full_adder port map(
			a => X(3),
			b => Y(3),
			Cin => c3,
			s => S(3),
			Cout => Cout
		);


end behavior;