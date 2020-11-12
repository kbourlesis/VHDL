entity D_ff_r_tb is
end D_ff_r_tb;

architecture behavior of D_ff_r_tb is

signal rstn,clk,d,q: bit;

component D_ff_r port(

	D,CLK,RSTN: in bit;
		 Q: out bit

);
end component;

begin

	D_ff_r1: D_ff_r port map(

		D => d,
		CLK => clk,
		RSTN => rstn,
		Q => q

	);

	process
	begin
		clk <= '1';wait for 25 ps;
		clk <= '0';wait for 30 ps;
		clk <= '1';wait for 25 ps;
		clk <= '0';wait for 35 ps;
		clk <= '1';wait for 25 ps;
		clk <= '0';wait for 35 ps;
		clk <= '1';wait for 25 ps;
		clk <= '0';wait for 35 ps;

	end process;

	process
	begin
		d <= '1';wait for 35 ps;
		d <= '0';wait for 60 ps;
		d <= '1';wait for 30 ps;
		d <= '0';wait for 25 ps;
		d <= '1';wait for 10 ps;
		d <= '0';wait for 25 ps;
		d <= '1';wait for 25 ps;
		d <= '0';wait for 20 ps;

	end process;

	process
	begin
		rstn <= '1';wait for 125 ps;
		rstn <= '0';wait for 85 ps;
	end process;

end behavior;
