library ieee;
use ieee.std_logic_1164.all;

entity Circuit is 
port( a,b: in std_logic;
        s: out std_logic);
end Circuit;

architecture archi of Circuit is 
begin 

s <= a xor b;

end archi;
