library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture testbench of tb is 

component Circuit is 
port( a,b: in std_logic;
        s: out std_logic);
end component;
 
signal a:std_logic:= '0';
signal b:std_logic:= '0';

signal s: std_logic;

begin 

uut: Circuit port map(a=> a, b=> b, s=>s);

a<= '0', '1' after 100 ns, '0' after 400 ns;
b<= '0', '1' after 200 ns, '0' after 500 ns;

end testbench;

