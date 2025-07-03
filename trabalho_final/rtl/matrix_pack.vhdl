library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package matrix_pack is

  -- Parametrização geral
  constant DEFAULT_DATA_WIDTH : positive := 8;
  constant DEFAULT_ORDER      : positive := 4;

  -- Tipo de dado da matriz
  subtype data_t is std_logic_vector(DEFAULT_DATA_WIDTH - 1 downto 0);

  -- Tipo de índice (suficiente para acessar N×N elementos)
  function index_width(N : positive) return natural;

  -- Tipo de matriz 1D para simular memória (N x N elementos)
  type matrix_mem_t is array(natural range <>) of data_t;

end package;


package body matrix_pack is

  -- Função que calcula a quantidade de bits necessária para endereçar N×N elementos
  function index_width(N : positive) return natural is
    variable total : natural := N * N;
    variable bits  : natural := 0;
  begin
    while (2**bits < total) loop
      bits := bits + 1;
    end loop;
    return bits;
  end function;

end package body;
