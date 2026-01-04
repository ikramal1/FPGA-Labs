LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Carrefour
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         Detection : IN  std_logic;
         Rp : OUT  std_logic;
         Op : OUT  std_logic;
         Vp : OUT  std_logic;
         Rs : OUT  std_logic;
         Os : OUT  std_logic;
         Vs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Detection : std_logic := '0';

 	--Outputs
   signal Rp : std_logic;
   signal Op : std_logic;
   signal Vp : std_logic;
   signal Rs : std_logic;
   signal Os : std_logic;
   signal Vs : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Carrefour PORT MAP (
          RESET => RESET,
          CLK => CLK,
          Detection => Detection,
          Rp => Rp,
          Op => Op,
          Vp => Vp,
          Rs => Rs,
          Os => Os,
          Vs => Vs
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';		wait for CLK_period/2;
		CLK <= '1';		wait for CLK_period/2;
   end process;
 
	RESET <= '1', '0' after 100 ns;
	
	Detection <= '0', '1' after 10 us, '0' after 300 us;
 

END;

