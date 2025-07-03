library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity transpose_bc is
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;

    -- Entradas de controle
    in_valid   : in  std_logic;
    done_in    : in  std_logic;
    done_out   : in  std_logic;

    -- Sinais de controle para o datapath
    zi         : out std_logic;
    zj         : out std_logic;
    ci         : out std_logic;
    cj         : out std_logic;
    we         : out std_logic;
    re         : out std_logic;
    enable     : out std_logic
  );
end entity;

architecture fsm of transpose_bc is

  -- Estados da FSM
  type state_t is (
    IDLE,
    INIT_LOAD, LOAD,
    INIT_TRANSPOSE, TRANSPOSE,
    DONE
  );
  signal state, next_state : state_t;

begin

  -- Processo de transição de estado
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        state <= IDLE;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  -- Processo de lógica de próximo estado
  process(state, in_valid, done_in, done_out)
  begin
    case state is

      when IDLE =>
        if in_valid = '1' then
          next_state <= INIT_LOAD;
        else
          next_state <= IDLE;
        end if;

      when INIT_LOAD =>
        next_state <= LOAD;

      when LOAD =>
        if done_in = '1' then
          next_state <= INIT_TRANSPOSE;
        else
          next_state <= LOAD;
        end if;

      when INIT_TRANSPOSE =>
        next_state <= TRANSPOSE;

      when TRANSPOSE =>
        if done_out = '1' then
          next_state <= DONE;
        else
          next_state <= TRANSPOSE;
        end if;

      when DONE =>
        next_state <= DONE;

      when others =>
        next_state <= IDLE;

    end case;
  end process;

  -- Processo de lógica de saída
  process(state)
  begin
    -- Valores padrão
    zi      <= '0';
    zj      <= '0';
    ci      <= '0';
    cj      <= '0';
    we      <= '0';
    re      <= '0';
    enable  <= '0';

    case state is

      when IDLE =>
        null;

      when INIT_LOAD =>
        zi <= '1';
        zj <= '1';
        enable <= '1';

      when LOAD =>
        enable <= '1';
        we     <= '1';
        ci     <= '1';  -- incrementa j depois (controlado externamente por datapath)
        cj     <= '1';

      when INIT_TRANSPOSE =>
        zi <= '1';
        zj <= '1';
        enable <= '1';

      when TRANSPOSE =>
        enable <= '1';
        re     <= '1';
        ci     <= '1';
        cj     <= '1';

      when DONE =>
        null;

      when others =>
        null;

    end case;
  end process;

end architecture;
