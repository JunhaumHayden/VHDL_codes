library IEEE;
use IEEE.Std_Logic_1164.all;
entity mux is
port (
    x,y,z,w: in std_logic_vector(3 downto 0);
    sel: in std_logic_vector(1 downto 0);
    m_sai: out std_logic_vector(3 downto 0)
 );
end mux;
architecture circuito of mux is
begin 
    m_sai <= 
        x when sel = "00" 
        else
        y when sel = "01" 
        else
        z when sel = "10" 
        else
    w;

end circuito;