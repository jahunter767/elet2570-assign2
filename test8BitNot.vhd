library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test8BitNot is
end test8BitNot;

architecture behav of test8BitNot is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    not0: not_8bit port map (A, Y);

    clk <= not clk after 1 ns;

    process begin
        A <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "11111111") report "Failed NOT test";

        A <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111110") report "Failed NOT test";

        A <= "00010000";
        wait until rising_edge(clk);
        assert (Y = "11101111") report "Failed NOT test";

        A <= "00010000";
        wait until rising_edge(clk);
        assert (Y = "11101111") report "Failed NOT test";

        assert false report "Finished test" severity failure;
    end process;
end behav;
