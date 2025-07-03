library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package transpose_pack is
  -- Função para converter índice 2D (linha, coluna) para 1D
  function to_index(i, j, N : integer) return integer;

  -- Função para converter vetor linearizado para matriz (transposta)
  function transpose_vector(
    input : std_logic_vector;
    N     : integer;
    bits_per_element : integer
  ) return std_logic_vector;
end package;

package body transpose_pack is

  function to_index(i, j, N : integer) return integer is
  begin
    return i * N + j;
  end;

  function transpose_vector(
    input : std_logic_vector;
    N     : integer;
    bits_per_element : integer
  ) return std_logic_vector is
    variable result : std_logic_vector(input'range);
  begin
    for i in 0 to N-1 loop
      for j in 0 to N-1 loop
        for k in 0 to bits_per_element-1 loop
          result((to_index(j,i,N)*bits_per_element)+k) := input((to_index(i,j,N)*bits_per_element)+k);
        end loop;
      end loop;
    end loop;
    return result;
  end;

end package body;
