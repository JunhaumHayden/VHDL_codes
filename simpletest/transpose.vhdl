library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.transpose_pack.all;

entity transpose is
  generic (
    N : positive := 3; -- Ordem da matriz
    bits_per_element : positive := 8 -- Largura dos elementos
  );
  port (
    clk      : in  std_logic;
    enable   : in  std_logic;
    input_matrix  : in  std_logic_vector(N*N*bits_per_element - 1 downto 0);
    output_matrix : out std_logic_vector(N*N*bits_per_element - 1 downto 0)
  );
end entity transpose;

architecture behavior of transpose is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if enable = '1' then
        output_matrix <= transpose_vector(input_matrix, N, bits_per_element);
      end if;
    end if;
  end process;
end architecture behavior;
