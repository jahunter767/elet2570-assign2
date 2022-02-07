library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test8BitComp is
end test8BitComp;

architecture behav of test8BitComp is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    comp0: comp_8bit port map (A, B, Flags(1));

    clk <= not clk after 1 ns;

    process begin
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags(1) = '0')
            report "Failed COMP test";

        A <= "00000010";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags(1) = '0')
            report "Failed COMP test";

        A <= "00000010";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags(1) = '0')
            report "Failed COMP test";

        A <= "10000000";
        B <= "10000000";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags(1) = '1')
            report "Failed COMP test";

        assert false report "Finished test" severity failure;
    end process;
end behav;
