library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.matrix_pack.all;

-- Entidade do bloco operativo (datapath)
entity transpose_bo is
  generic (
    N       : positive := 4;  -- Ordem da matriz
    DATA_W  : positive := 8   -- Largura dos dados (bits por elemento)
  );
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    enable    : in  std_logic;

    -- Entrada sequencial (um dado por vez)
    data_in   : in  std_logic_vector(DATA_W-1 downto 0);
    in_valid  : in  std_logic;

    -- Saída sequencial (um dado por vez)
    data_out  : out std_logic_vector(DATA_W-1 downto 0);
    out_valid : out std_logic;

    -- Controle externo
    zi        : in  std_logic;  -- zera i
    ci        : in  std_logic;  -- conta i
    zj        : in  std_logic;  -- zera j
    cj        : in  std_logic;  -- conta j
    we        : in  std_logic;  -- write enable
    re        : in  std_logic;  -- read enable
    done_in   : out std_logic;  -- terminou de ler entrada
    done_out  : out std_logic   -- terminou de escrever saída
  );
end entity;

architecture rtl of transpose_bo is
  -- Constantes
  constant ADDR_W : integer := log2_ceil(N * N);

  -- Memória interna para armazenar a matriz
  type memory_t is array(0 to N*N - 1) of std_logic_vector(DATA_W-1 downto 0);
  signal mem : memory_t := (others => (others => '0'));

  -- Registradores de índice
  signal i, j : integer range 0 to N-1 := 0;

  -- Contador de elementos lidos/escritos
  signal count_in, count_out : integer range 0 to N*N := 0;

begin
  -- Processo de controle de índices e leitura/escrita sequencial
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        i <= 0;
        j <= 0;
        count_in  <= 0;
        count_out <= 0;
        data_out  <= (others => '0');
        out_valid <= '0';
      else
        -- Atualização dos índices
        if zi = '1' then
          i <= 0;
        elsif ci = '1' and i < N-1 then
          i <= i + 1;
        end if;

        if zj = '1' then
          j <= 0;
        elsif cj = '1' and j < N-1 then
          j <= j + 1;
        end if;

        -- Escrita na memória (modo entrada)
        if enable = '1' and we = '1' and in_valid = '1' then
          mem(i * N + j) <= data_in;
          count_in <= count_in + 1;
        end if;

        -- Leitura da transposta da memória
        if enable = '1' and re = '1' then
          data_out <= mem(j * N + i);
          out_valid <= '1';
          count_out <= count_out + 1;
        else
          out_valid <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Sinaliza se toda a entrada foi lida
  done_in  <= '1' when count_in  = N*N else '0';
  done_out <= '1' when count_out = N*N else '0';

end architecture;
