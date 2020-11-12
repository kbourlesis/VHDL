library ieee;
use ieee.std_logic_1164.all;

entity dataMemory_tb is
end entity;

architecture behavioral of dataMemory_tb is

signal ADDR: std_logic_vector(5 downto 0);
signal WRITED, READD: std_logic_vector(31 downto 0);
signal WE, RE, CLK: std_logic;

component dataMemory
  port(
    Addr: in std_logic_vector(5 downto 0);
    writeD: in std_logic_vector(31 downto 0);
    we: in std_logic;
    re: in std_logic;
    clk: in std_logic;
    readD : out std_logic_vector(31 downto 0)
  );
end component;

begin

  MIPS_MEM1: component dataMemory
    port map(
      Addr => ADDR,
      writeD => WRITED,
      we => WE,
      re => RE,
      clk => CLK,
      readD => READD
    );

  process
  begin

    ADDR <= "000000";
    WE <= '1';
    RE <= '0';
    WRITED <= "01010101010101010101010101010101";
    CLK <= '0';
    wait for 100 ns;

    CLK <= '1';
    wait for 100 ns;

    ADDR <= "000001";
    WRITED <= "11011101110111011101110111011101";
    CLK <= '0';
    wait for 100 ns;

    CLK <= '1';
    wait for 100 ns;

    ADDR <= "000010";
    WRITED <= "00100010001000100010001000100010";
    CLK <= '0';
    wait for 100 ns;

    CLK <= '1';
    wait for 100 ns;

    ADDR <= "000011";
    WRITED <= "10011001100110011001100110011001";
    CLK <= '0';
    wait for 100 ns;

    CLK <= '1';
    wait for 100 ns;

    ADDR <= "000000";
    WE <= '0';
    RE <= '1';
    CLK <= '0';
    wait for 100 ns;

    CLK <= '1';
    wait for 100 ns;

    ADDR <= "000001";
    CLK <= '0';
    wait for 100 ns;

    assert false report "Reached end of test.";
    wait;

  end process;

end architecture;
