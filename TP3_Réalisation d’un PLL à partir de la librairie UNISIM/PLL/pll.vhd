----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:50:21 01/07/2026 
-- Design Name: 
-- Module Name:    pll - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity pll is
    Port ( CLK : in  STD_LOGIC;
           PLL2x, PLL4x : out  STD_LOGIC);
end pll;

architecture Behavioral of pll is
signal CLK_IBUFG, CLK2x, CLK2xBUFG, LOCKED2x, Q, NOT_Q, CLK4x, CLK4xBUFG, LOCKED4x, LOCKED4xOBUF: std_logic;
begin

CopyIBUFG: IBUFG port map(I => CLK, O => CLK_IBUFG);

Copy1CLKDLL: CLKDLL port map(CLKIN => CLK_IBUFG, CLKFB => CLK2xBUFG, RST => '0', CLK0 => open, CLK90 => open, 
CLK180 => open, CLK270 => open, CLK2x => CLK2x, CLKDV => open, LOCKED => LOCKED2x);

Copy2CLKDLL: CLKDLL port map(CLKIN => CLK2xBUFG, CLKFB => CLK4xBUFG, RST => NOT_Q, CLK0 => open, CLK90 => open, 
CLK180 => open, CLK270 => open, CLK2x => CLK4x, CLKDV => open, LOCKED => LOCKED4x);

CopySRL16: SRL16 port map(D => LOCKED2x, CLK => CLK2xBUFG, A0 => '0', A1 => '0', A2 => '0', A3 => '0', Q => Q);

--NOT_Q <= not(Q);

CopyINV: INV port map(I => Q, O => NOT_Q);

Copy1BUFG: BUFG port map(I => CLK2x, O => CLK2xBUFG);

Copy2BUFG: BUFG port map(I => CLK4x, O => CLK4xBUFG);

CopyOBUF: OBUF port map(I => LOCKED4x, O => LOCKED4xOBUF);

PLL2x <= CLK2xBUFG when LOCKED2x = '1' else '0';
PLL4x <= CLK4xBUFG when LOCKED4x = '1' else '0';

end Behavioral;

