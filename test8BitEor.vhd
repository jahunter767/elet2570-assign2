library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test8BitEor is
end test8BitEor;

architecture behav of test8BitEor is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    eor0: eor_8bit port map (A, B, Y);

    clk <= not clk after 1 ns;

    process begin
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001") report "Failed EOR test";

        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000") report "Failed EOR test";

        A <= "00010000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00010001") report "Failed EOR test";

        A <= "00010000";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "00010000") report "Failed EOR test";

        assert false report "Finished test" severity failure;
    end process;
end behav;