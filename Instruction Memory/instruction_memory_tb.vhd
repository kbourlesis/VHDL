library ieee;
use ieee.std_logic_1164.all;

entity instruction_memory_tb is
end entity;

architecture arch of instruction_memory_tb is

signal ADDR: std_logic_vector(3 downto 0);
signal INSTRUCTION: std_logic_vector(31 downto 0);

component instrMemory
  port(
    Addr : in std_logic_vector(3 downto 0);
    Instruction: out std_logic_vector(31 downto 0)
  );
end component;

begin

  instr_mem1: component instrMemory
    port map(
      Addr => ADDR,
      Instruction => INSTRUCTION
    );

    process
    begin

      ADDR <= "0101";
      wait for 100 ns;

      ADDR <= "0100";
      wait for 100 ns;

      ADDR <= "0111";
      wait for 100 ns;

      assert false report "Reached end of test.";
      wait;

    end process;

end architecture;
