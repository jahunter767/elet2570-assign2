library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test8BitAdd is
end test8BitAdd;

architecture behav of test8BitAdd is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0) := "00000000";
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    add0: add_8bit port map (A, B, Y, Flags(2));

    clk <= not clk after 1 ns;

    process begin
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags(2) = '0')
            report "Failed ADD test";

        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000010" and Flags(2) = '0')
            report "Failed ADD test";

        A <= "10000001";
        B <= "10000001";
        wait until rising_edge(clk);
        assert (Y = "00000010" and Flags(2) = '1')
            report "Failed ADD test";

        A <= "01000001";
        B <= "01000001";
        wait until rising_edge(clk);
        assert (Y = "10000010" and Flags(2) = '0')
            report "Failed ADD test";

        assert false report "Finished test" severity failure;
    end process;
end behav;
