library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel_tb is
end entity;

architecture sim of toplevel_tb is
    -- Component declaration for the toplevel module
    component toplevel
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            -- Add other ports as needed
            input_a : in  std_logic_vector(7 downto 0);
            output_z: out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals to connect to the toplevel
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '0';
    signal input_a  : std_logic_vector(7 downto 0) := (others => '0');
    signal output_z : std_logic_vector(7 downto 0);

begin
    -- Instantiate the toplevel module
    uut: toplevel
        port map (
            clk      => clk,
            rst      => rst,
            input_a  => input_a,
            output_z => output_z
        );

    -- Clock generation
    clk_process : process
    begin
        while now < 1 ms loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset
        rst <= '1';
        wait for 25 ns;
        rst <= '0';
        wait for 20 ns;

        -- Test vector 1
        input_a <= x"0A";
        wait for 40 ns;

        -- Test vector 2
        input_a <= x"55";
        wait for 40 ns;

        -- Test vector 3
        input_a <= x"FF";
        wait for 40 ns;

        -- Finish simulation
        wait;
    end process;

end architecture;