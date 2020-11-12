library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regfile_ex is

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

end regfile_ex;

architecture behavioral of regfile_ex is

  type regArray is array(0 to size-1) of std_logic_vector(dw-1 downto 0);
  signal registerfile : regArray;

  begin

    process(clk, reset)
    begin

      if(reset = '1') then
        forlp : for i in 0 to size-1 loop
                  registerfile(i) <= "0000";
                end loop;
      end if;

      if (falling_edge(clk)) then

        if (we = '1') then
          registerfile(to_integer(unsigned(wAddr))) <= dataIn;
        end if;

      end if;

      if (we = '0') then
        dataOut1 <= registerfile(to_integer(unsigned(rAddr1)));
        dataOut2 <= registerfile(to_integer(unsigned(rAddr2)));
      end if;

    end process;

end behavioral;
