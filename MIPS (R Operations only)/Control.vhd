library ieee;
use ieee.std_logic_1164.all;

entity Control is port (
  OP_5to0: in std_logic_vector(5 downto 0);
  RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg: out std_logic;
  ALU_op: out std_logic_vector(1 downto 0));
end Control;

architecture arch of Control is
begin

  process(OP_5to0)
  begin
    case( OP_5to0 ) is

      when "000000" =>
        RegDst <= '1';
        ALUSrc <= '0';
        MemtoReg <= '0';
        RegWrite <= '1';
        MemRead <= '0';
        MemWrite <= '0';
        Branch <= '0';
        ALU_op <= "10";

      when "100011" =>
        RegDst <= '0';
        ALUSrc <= '1';
        MemtoReg <= '1';
        RegWrite <= '1';
        MemRead <= '1';
        MemWrite <= '0';
        Branch <= '0';
        ALU_op <= "00";

      when "101011" =>
        --RegDst <= ;
        ALUSrc <= '1';
        --MemtoReg <= ;
        RegWrite <= '0';
        MemRead <= '0';
        MemWrite <= '1';
        Branch <= '0';
        ALU_op <= "00";

      when "000100" =>
        --RegDst <= ;
        ALUSrc <= '0';
        --MemtoReg <= 0;
        RegWrite <= '0';
        MemRead <= '0';
        MemWrite <= '0';
        Branch <= '1';
        ALU_op <= "01";

      when others =>
        RegDst <= 'X';
        ALUSrc <= 'X';
        MemtoReg <= 'X';
        RegWrite <= 'X';
        MemRead <= 'X';
        MemWrite <= 'X';
        Branch <= 'X';
        ALU_op <= "XX";

    end case;
  end process;

end architecture;
