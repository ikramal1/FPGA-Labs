library ieee;
use ieee.std_logic_1164.all;

entity tb_decode is
end tb_decode;

architecture test of tb_decode is

    -- composant à tester
    component Decode is
        port (
            E : in  std_logic_vector(1 downto 0);
            S : out std_logic_vector(3 downto 0)
        );
    end component;

    signal E_tb : std_logic_vector(1 downto 0) := "00";
    signal S_tb : std_logic_vector(3 downto 0);

begin
    -- Unit Under Test: l’instance du composant que l’on teste dans le testbench.
    uut: Decode
        port map (
            E => E_tb,
            S => S_tb
        );

    -- stimuli
    stim_proc : process
    begin
        E_tb <= "00";
        wait for 50 ns;
        E_tb <= "01";
        wait for 50 ns;
        E_tb <= "10";
        wait for 50 ns;
        E_tb <= "11";
        wait for 50 ns;
        wait; -- stop
    end process;

end test;


