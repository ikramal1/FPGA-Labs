library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Carrefour is generic(M: natural := 50);
    Port ( RESET, CLK, Detection : in  STD_LOGIC;
           Rp, Op, Vp, Rs, Os, Vs : out  STD_LOGIC);
end Carrefour;

architecture Behavioral of Carrefour is
type etat is (etat_defaut, etat_OpRs, etat_RpRs, etat_RpVs, etat_RpOs, etat_RsRp, etat_VpRs);
signal etata, etatf: etat;
signal cpt130s: natural range 0 to 129;
signal En_1Hz: std_logic;

component DiviseurHorloge is generic(N: natural := 50);
    Port ( RESET, CLK : in  STD_LOGIC;
           En_1MHz : out  STD_LOGIC);
end component;

begin

CopyDiviseurHorloge: DiviseurHorloge generic map(N => M)
port map(RESET => RESET, CLK => CLK, En_1MHz => En_1Hz);

process(RESET, CLK)
begin
if RESET = '1' then cpt130s <= 0;
elsif rising_edge(CLK) then
	if En_1Hz = '1' then 
		if cpt130s = 129 or etata = etat_defaut then cpt130s <= 0;
		else cpt130s <= cpt130s + 1;
		end if;
	end if;
end if;
end process;

process(RESET, Detection, etata, cpt130s)
begin
if RESET = '1' then etatf <= etat_defaut;
else 	case etata is
			when etat_defaut	=> if Detection = '1' then etatf <= etat_OpRs;
										else etatf <= etat_defaut;
										end if;
			when etat_OpRs		=> if cpt130s = 9 then etatf <= etat_RpRs;
										else etatf <= etat_OpRs;
										end if;
			when etat_RpRs		=> if cpt130s = 19 then etatf <= etat_RpVs;
										else etatf <= etat_RpRs;
										end if;
			when etat_RpVs		=> if cpt130s = 49 then etatf <= etat_RpOs;
										else etatf <= etat_RpVs;
										end if;
			when etat_RpOs		=>	if cpt130s = 59 then etatf <= etat_RsRp;
										else etatf <= etat_RpOs;
										end if;
			when etat_RsRp		=> if cpt130s = 69 then etatf <= etat_VpRs;
										else etatf <= etat_RsRp;
										end if;
			when etat_VpRs		=> if cpt130s = 129 then etatf <= etat_defaut;
										else etatf <= etat_VpRs;
										end if;
			when others			=> NULL;
		end case;
end if;
end process;

process(RESET, CLK)
begin
if RESET = '1' then etata <= etat_defaut;
elsif rising_edge(CLK) then etata <= etatf;
end if;
end process;

process(etata)
begin

Rp <= '0'; Op <= '0'; Vp <= '0';
Rs <= '0'; Os <= '0'; Vs <= '0';

case etata is
	when etat_defaut	=>	Vp <= '1';	Rs <= '1';
	when etat_OpRs		=> Op <= '1'; 	Rs <= '1';
	when etat_RpRs		=> Rp <= '1';	Rs <= '1';
	when etat_RpVs		=> Rp <= '1';	Vs <= '1';
	when etat_RpOs		=> Rp <= '1';	Os <= '1';
	when etat_RsRp		=> Rp <= '1';	Rs <= '1';
	when etat_VpRs		=> Vp <= '1';	Rs <= '1';
	when others			=> NULL;
end case;
end process;

end Behavioral;


