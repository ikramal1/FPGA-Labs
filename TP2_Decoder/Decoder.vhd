library ieee;
use ieee.std_logic_1164.all;

entity Decoder is
     port (
	     E: in std_logic_vector(1 downto 0);
		 S: out std_logic_vector(3 downto 0));
end Decoder;

architecture combinatoire of Decoder is
begin
   S <= "0000" when E = "00" else
        "0010" when E = "01" else
		"0100" when E = "10" else
		"1000";
end combinatoire;
