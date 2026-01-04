LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DiviseurHorloge
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         En_1MHz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal En_1MHz : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DiviseurHorloge PORT MAP (
          RESET => RESET,
          CLK => CLK,
          En_1MHz => En_1MHz
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';		wait for CLK_period/2;
		CLK <= '1';		wait for CLK_period/2;
   end process;
 
	RESET <= '1', '0' after 100 ns;
  

END;


