library ieee;
use ieee.std_logic_1164.all;

entity ALU_32bit_tb is
  generic(DW : natural := 4);
end ALU_32bit_tb;

architecture behavior of ALU_32bit_tb is

signal input1, input2: std_logic_vector(DW-1 downto 0);
signal ctrl: std_logic_vector(3 downto 0);
signal output1: std_logic_vector(DW-1 downto 0);
signal ZR: std_logic;

component ALU_32bit

  generic(dw : natural);

  port(
    ALUin1, ALUin2: in std_logic_vector(dw-1 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout: out std_logic_vector(dw-1 downto 0);
    zero: out std_logic
  );
end component;

begin

ALU1: component ALU_32bit

generic map(dw => DW)

port map(
  ALUin1 => input1,
  ALUin2 => input2,
  ALUctrl => ctrl,
  ALUout => output1,
  zero => ZR
);

  process
  begin

    input1 <= "1001";
    input2 <= "0000";
    ctrl <= "0000";
    wait for 50 ns;

    input1 <= "0010";
    input2 <= "0100";
    ctrl <= "0010";
    wait for 50 ns;

    input1 <= "0100";
    input2 <= "1111";
    ctrl <= "0000";
    wait for 50 ns;

    input1 <= "0100";
    input2 <= "1111";
    ctrl <= "0001";
    wait for 50 ns;

    input1 <= "0100";
    input2 <= "0010";
    ctrl <= "0110";
    wait for 50 ns;

    input1 <= "0100";
    input2 <= "0110";
    ctrl <= "0110";
    wait for 50 ns;

    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "00000000000000000000000000000000";
    -- ctrl <= "0000";
    -- wait for 50 ns;
    --
    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "00001001001111100010110100010011";
    -- ctrl <= "0010";
    -- wait for 50 ns;
    --
    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "00001001001111100010110100010011";
    -- ctrl <= "0000";
    -- wait for 50 ns;
    --
    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "00001001001111100010110100010011";
    -- ctrl <= "0001";
    -- wait for 50 ns;
    --
    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "00001001001111100010110100010011";
    -- ctrl <= "0110";
    -- wait for 50 ns;
    --
    -- input1 <= "10011001100110011001100110011001";
    -- input2 <= "11001001001111100010110100010011";
    -- ctrl <= "0110";
    -- wait for 50 ns;

    assert false report "Reached the end of the testbench.";
    wait;

  end process;

end architecture;
