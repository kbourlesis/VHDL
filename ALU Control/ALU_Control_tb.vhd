library ieee;
use ieee.std_logic_1164.all;

entity ALU_Ctrl_tb is
end entity;

architecture behavior of ALU_Ctrl_tb is

signal OP_5TO0: std_logic_vector(5 downto 0);
signal ALU_OP: std_logic_vector(1 downto 0);
signal OPERATION: std_logic_vector(3 downto 0);

component ALU_Ctrl is

  port (
    OP_5to0: in std_logic_vector(5 downto 0);
    ALU_op: in std_logic_vector(1 downto 0);
    Operation: out std_logic_vector(3 downto 0)
  );

end component;

begin

  ALU_Ctrl1: component ALU_Ctrl
    port map(
      OP_5to0 => OP_5TO0,
      ALU_op => ALU_OP,
      Operation => OPERATION
    );

    process
    begin

      ALU_OP <= "00";
      OP_5TO0 <= "001001";
      wait for 100 ns;

      ALU_OP <= "00";
      OP_5TO0 <= "001010";
      wait for 100 ns;

      ALU_OP <= "11";
      OP_5TO0 <= "001010";
      wait for 100 ns;

      ALU_OP <= "01";
      OP_5TO0 <= "100111";
      wait for 100 ns;

      ALU_OP <= "10";
      OP_5TO0 <= "100000";
      wait for 100 ns;

      ALU_OP <= "10";
      OP_5TO0 <= "100010";
      wait for 100 ns;

      ALU_OP <= "10";
      OP_5TO0 <= "100100";
      wait for 100 ns;

      ALU_OP <= "10";
      OP_5TO0 <= "100101";
      wait for 100 ns;

      ALU_OP <= "10";
      OP_5TO0 <= "101010";
      wait for 100 ns;

      assert false report "Reached end of the test.";
      wait;

    end process;

end architecture;
