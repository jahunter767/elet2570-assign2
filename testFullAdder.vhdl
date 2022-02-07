library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity testFullAdder is
end testFullAdder;

architecture behav of testFullAdder is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    add0: fullAdder port map (A(0), A(1), A(2), Y(0), Flags(2));

    clk <= not clk after 1 ns;

    process begin
        A(0) <= '0'; A(1) <= '0'; A(2) <= '0';
        wait until rising_edge(clk);
        assert (Y(0) = '0' and Flags(2) = '0')
            report "Failed ADD test";

        A(0) <= '0'; A(1) <= '0'; A(2) <= '1';
        wait until rising_edge(clk);
        assert (Y(0) = '1' and Flags(2) = '0')
            report "Failed ADD test";

        A(0) <= '0'; A(1) <= '1'; A(2) <= '0';
        wait until rising_edge(clk);
        assert (Y(0) = '1' and Flags(2) = '0')
            report "Failed ADD test";

        A(0) <= '0'; A(1) <= '1'; A(2) <= '1';
        wait until rising_edge(clk);
        assert (Y(0) = '0' and Flags(2) = '1')
            report "Failed ADD test";

        A(0) <= '1'; A(1) <= '1'; A(2) <= '1';
        wait until rising_edge(clk);
        assert (Y(0) = '1' and Flags(2) = '1')
            report "Failed ADD test";

        assert false report "Finished test" severity failure;
    end process;
end behav;
