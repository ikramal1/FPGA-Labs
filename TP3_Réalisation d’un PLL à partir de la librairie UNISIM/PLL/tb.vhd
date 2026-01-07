----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:50 01/07/2026 
-- Design Name: 
-- Module Name:    tb - archi 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
end tb;

architecture archi of tb is

    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pll
    PORT(
         CLK : IN  std_logic;
         PLL2x : OUT  std_logic;
         PLL4x : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal PLL2x : std_logic;
   signal PLL4x : std_logic;
 

begin

	-- Instantiate the Unit Under Test (UUT)
   uut: pll PORT MAP (
          CLK => CLK,
          PLL2x => PLL2x,
          PLL4x => PLL4x
        );

   CLK_process :process
   begin
		CLK <= '0';		wait for 10 ns;
		CLK <= '1';		wait for 10 ns;
   end process;



end archi;

