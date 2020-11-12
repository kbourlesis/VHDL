entity D_ff_r is port(

	D: in bit;
	CLK: in bit;
	RSTN: in bit;
	Q: out bit

);
end D_ff_r;

architecture behavior of D_ff_r is
begin

	process(D,CLK,RSTN)
	begin

		if(RSTN = '0') then
			Q <= '0';
		end if;

		if(rising_edge(CLK) and RSTN = '1') then
			Q <= D;
		end if;

	end process;

end behavior;
