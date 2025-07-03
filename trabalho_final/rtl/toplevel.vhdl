library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.matrix_pack.all;

entity transpose is
  generic (
    CFG : matrix_config_t := (
      data_width => 8,
      order      => 4
    )
  );
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;

    in_valid : in  std_logic;
    data_in  : in  std_logic_vector(CFG.data_width - 1 downto 0);
    data_out : out std_logic_vector(CFG.data_width - 1 downto 0);
    out_valid: out std_logic
  );
end entity;

architecture rtl of transpose is

  -- Sinais internos para controle
  signal zi, zj       : std_logic;
  signal ci, cj       : std_logic;
  signal we, re       : std_logic;
  signal enable       : std_logic;

  -- Sinais de status
  signal done_in      : std_logic;
  signal done_out     : std_logic;

  -- Sinal de dados entre controle e datapath
  signal data_reg_out : std_logic_vector(CFG.data_width - 1 downto 0);

begin

  -- Instanciação do bloco de controle
  bc_inst : entity work.transpose_bc
    port map (
      clk      => clk,
      rst      => rst,
      in_valid => in_valid,
      done_in  => done_in,
      done_out => done_out,

      zi       => zi,
      zj       => zj,
      ci       => ci,
      cj       => cj,
      we       => we,
      re       => re,
      enable   => enable
    );

  -- Instanciação do bloco operativo
  bo_inst : entity work.transpose_bo
    generic map (
      CFG => CFG
    )
    port map (
      clk       => clk,
      rst       => rst,
      enable    => enable,

      data_in   => data_in,
      data_out  => data_out,

      zi        => zi,
      zj        => zj,
      ci        => ci,
      cj        => cj,
      we        => we,
      re        => re,

      done_in   => done_in,
      done_out  => done_out,
      out_valid => out_valid
    );

end architecture;
