library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU_Ctrl is
  port (
    OP_5to0: in std_logic_vector(5 downto 0);
    ALU_op: in std_logic_vector(1 downto 0);
    Operation: out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavior of ALU_Ctrl is
begin

  process(ALU_op, OP_5to0)
  begin
    Operation(0) <= (OP_5to0(0) or OP_5to0(3)) and ALU_op(1);
    Operation(1) <= not OP_5to0(2) or not ALU_op(1);
    Operation(2) <= (OP_5to0(1) and ALU_op(1)) or ALU_op(0);
    Operation(3) <= '0';
  end process;

end architecture;
