library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DiviseurHorloge is generic(N: natural := 50);
    Port ( RESET, CLK : in  STD_LOGIC;
           En_1MHz : out  STD_LOGIC);
end DiviseurHorloge;

architecture Behavioral of DiviseurHorloge is
signal cpt: natural range 0 to N-1;
begin

process(RESET, CLK)
begin
if RESET = '1' then cpt <= 0;
elsif rising_edge(CLK) then
	if cpt = N-1 then cpt <= 0;
	else cpt <= cpt + 1;
	end if;
end if;
end process;

En_1MHz <= '1' when cpt = N-1 else '0';

end Behavioral;

