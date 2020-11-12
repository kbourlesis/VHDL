library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU_32bit is

  generic(dw : natural);

  port(
    ALUin1, ALUin2: in std_logic_vector(dw-1 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout: out std_logic_vector(dw-1 downto 0);
    zero: out std_logic
  );
end ALU_32bit;

architecture behavior of ALU_32bit is

begin

  process(ALUin1, ALUin2, ALUctrl)
  variable alu_out: std_logic_vector(dw-1 downto 0);
  begin

    case( ALUctrl ) is

      when "0000" =>
        alu_out := ALUin1 and ALUin2;

      when "0001" =>
        alu_out := ALUin1 or ALUin2;

      when "0010" =>
        alu_out := ALUin1 + ALUin2;

      when "0110" =>
        alu_out := ALUin1 - ALUin2;

      when others =>

        if (dw = 4) then
          alu_out := "XXXX";
        else if (dw = 32) then
          alu_out := "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if;
        end if;

    end case;

    if (alu_out = "0000") or (alu_out = "00000000000000000000000000000000") then
      zero <= '1';
    else
      zero <= '0';
    end if;

    ALUout <= alu_out;

  end process;

end architecture;
