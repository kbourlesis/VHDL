library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mips_R is
  generic (
    DW : natural;
    SIZE : natural;
    ADRW : natural
  );

  port (
    Instr_addr: in std_logic_vector(3 downto 0);
    RESET, CLK: in std_logic
  );
end entity;

architecture stractural of mips_R is

signal ZR, REGDEST, REGWRITE, ALUSRC, BRANCH, MEMREAD, MEMWRITE, MEMTOREG: std_logic;
signal INSTRUCTION: std_logic_vector(31 downto 0);
signal ALUOUT: std_logic_vector(DW-1 downto 0);
signal OPERATION: std_logic_vector(3 downto 0);
signal ALU_OP: std_logic_vector(1 downto 0);
signal DATAOUT1,DATAOUT2: std_logic_vector(DW-1 downto 0);

component ALU_32bit
  generic(dw : natural);

  port(
    ALUin1, ALUin2: in std_logic_vector(dw-1 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout: out std_logic_vector(dw-1 downto 0);
    zero: out std_logic
  );
end component;

component regfile_ex
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
end component;

component instrMemory
  port (
    Addr: in std_logic_vector(3 downto 0);
    Instruction: out std_logic_vector(31 downto 0)
  );
end component;

component Control
  port(
    OP_5to0: in std_logic_vector(5 downto 0);
    RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg: out std_logic;
    ALU_op: out std_logic_vector(1 downto 0)
  );
end component;

component ALU_Ctrl
  port (
    OP_5to0: in std_logic_vector(5 downto 0);
    ALU_op: in std_logic_vector(1 downto 0);
    Operation: out std_logic_vector(3 downto 0)
  );
end component;

begin

  ALU: ALU_32bit
    generic map(
      dw => DW
    )

    port map(
      ALUin1 => DATAOUT1,
      ALUin2 => DATAOUT2,
     ALUctrl => OPERATION,
      ALUout => ALUOUT,
        zero => ZR
    );

  ALU_Control: ALU_Ctrl
    port map(
      OP_5to0 => INSTRUCTION(5 downto 0),
       ALU_op => ALU_OP,
    Operation => OPERATION
    );

  RegFile: regfile_ex
    generic map(
        dw => DW,
      size => SIZE,
      adrw => ADRW
    )

    port map(
        dataIn => ALUOUT,
        rAddr1 => INSTRUCTION(23 downto 21),
        rAddr2 => INSTRUCTION(18 downto 16),
         wAddr => INSTRUCTION(13 downto 11),
            we => REGWRITE,
           clk => CLK,
         reset => RESET,
      dataOut1 => DATAOUT1,
      dataOut2 => DATAOUT2
    );

  Instruction_memory: instrMemory
    port map(
             Addr => Instr_addr,
      Instruction => INSTRUCTION
    );

  Control1: Control
    port map(
      OP_5to0 => INSTRUCTION(31 downto 26),
       RegDst => REGDEST,
     RegWrite => REGWRITE,
       ALUSrc => ALUSRC,
       Branch => BRANCH,
      MemRead => MEMREAD,
     MemWrite => MEMWRITE,
     MemtoReg => MEMTOREG,
       ALU_op => ALU_OP
    );

end architecture;
