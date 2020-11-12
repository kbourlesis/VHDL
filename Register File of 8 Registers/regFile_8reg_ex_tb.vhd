library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regfile_ex_tb is
  generic ( DW : natural := 4;
          SIZE : natural := 8;
          ADRW : natural := 3);
end regfile_ex_tb;

architecture behavioral of regfile_ex_tb is

  signal DATAIN,DATAOUT1,DATAOUT2: std_logic_vector(DW-1 downto 0);
  signal WE,CLK,RESET: std_logic;
  signal raddr1,raddr2,waddr: std_logic_vector(ADRW-1 downto 0);

  component regfile_ex
    generic ( dw : natural;
            size : natural;
            adrw : natural);

    port ( dataIn : in std_logic_vector(dw-1 downto 0);
      rAddr1 : in std_logic_vector(adrw-1 downto 0);
      rAddr2 : in std_logic_vector(adrw-1 downto 0);
       wAddr : in std_logic_vector(adrw-1 downto 0);
          we : in std_logic;
         clk : in std_logic;
       reset : in std_logic;
    dataOut1 : out std_logic_vector(dw-1 downto 0);
    dataOut2 : out std_logic_vector(dw-1 downto 0));
  end component;

  begin

    regFile_4bitreg: regfile_ex

      generic map(
        dw => DW,
        size => SIZE,
        adrw => ADRW
      )

      port map(
        dataIn => DATAIN,
        rAddr1 => raddr1,
        rAddr2 => raddr2,
        wAddr => waddr,
        we => WE,
        clk => CLK,
        reset => RESET,
        dataOut1 => DATAOUT1,
        dataOut2 => DATAOUT2
      );

    process
    begin

      RESET <= '0';
      WE <= '1';
      waddr <= "000";
      dataIn <= "0101";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      waddr <= "001";
      dataIn <= "1101";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      waddr <= "010";
      dataIn <= "0010";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      waddr <= "011";
      dataIn <= "1001";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      WE <= '0';
      raddr1 <= "000";
      raddr2 <= "010";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      raddr1 <= "001";
      raddr2 <= "011";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      RESET <= '1';
      raddr1 <= "000";
      raddr2 <= "010";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      raddr1 <= "001";
      raddr2 <= "011";
      CLK <= '1';
      wait for 50 ns;

      CLK <= '0';
      wait for 50 ns;

      assert false report "Reached end of test.";
      wait;

    end process;


end behavioral;
