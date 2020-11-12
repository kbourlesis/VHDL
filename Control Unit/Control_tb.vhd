library ieee;
use ieee.std_logic_1164.all;

entity Control_tb is
end entity;

architecture arch of Control_tb is

signal OP_5TO0: std_logic_vector(5 downto 0);
signal REGDEST, REGWRITE, ALUSRC, BRANCH, MEMREAD, MEMWRITE, MEMTOREG: std_logic;
signal ALU_OP: std_logic_vector(1 downto 0);

component Control
  port(
    OP_5to0: in std_logic_vector(5 DOWNTO 0);
    RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg: out std_logic;
    ALU_op: out std_logic_vector(1 downto 0)
  );
end component;

begin

  Ctrl1: Control
    port map(
      OP_5to0 => OP_5TO0,
      RegDst => REGDEST,
      RegWrite => REGWRITE,
      ALUSrc => ALUSRC,
      Branch => BRANCH,
      MemRead => MEMREAD,
      MemWrite => MEMWRITE,
      MemtoReg => MEMTOREG,
      ALU_op => ALU_OP
    );

  process
  begin

    OP_5TO0 <= "000000";
    wait for 100 ns;

    OP_5TO0 <= "100011";
    wait for 100 ns;

    OP_5TO0 <= "101011";
    wait for 100 ns;

    OP_5TO0 <= "000100";
    wait for 100 ns;

    assert false report "Reached end of test.";
    wait;

  end process;

end architecture;
