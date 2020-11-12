library ieee;
use ieee.std_logic_1164.all;

entity mips_R_tb is
  generic(dw : natural := 32;
  size : natural := 8;
  adrw : natural := 3);
end entity;

architecture arch of mips_R_tb is

signal INSTR_ADDR: std_logic_vector(3 downto 0);
signal reset, clk: std_logic;

component mips_R

  generic (
    DW : natural;
    SIZE : natural;
    ADRW : natural
  );

  port(
    Instr_addr: in std_logic_vector(3 downto 0);
    RESET, CLK: in std_logic
  );

end component;

begin

  MIPS: mips_R
    generic map(
      DW => dw,
      SIZE => size,
      ADRW => adrw
    )

    port map(
      Instr_addr => INSTR_ADDR,
      RESET => reset,
      CLK => clk
    );

    process
    begin

      INSTR_ADDR <= "0000";
      reset <= '0';
      clk <= '1';
      wait for 100 ns;

      clk <= '0';
      wait for 100 ns;

      INSTR_ADDR <= "0001";
      clk <= '1';
      wait for 100 ns;

      clk <= '0';
      wait for 100 ns;

      INSTR_ADDR <= "0010";
      clk <= '1';
      wait for 100 ns;

      RESET <= '1';
      clk <= '0';
      wait for 100 ns;

      clk <= '1';
      wait for 100 ns;

      RESET <= '0';
      clk <= '0';
      wait for 100 ns;

      assert false report "Reached end of test.";
      wait;

    end process;

end architecture;
