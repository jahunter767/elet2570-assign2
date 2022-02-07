library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test8BitMul is
end test8BitMul;

architecture behav of test8BitMul is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    mul0: mul_8bit port map (A, B, Y, Flags(3));

    clk <= not clk after 1 ns;

    process begin
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags(3) = '0')
            report "Failed MUL test";

        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags(3) = '0')
            report "Failed MUL test";

        A <= "01000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "01000000" and Flags(3) = '0')
            report "Failed MUL test";

        A <= "10000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "10000000" and Flags(3) = '1')
            report "Failed MUL test";

        A <= "10000000";
        B <= "00000010";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags(3) = '1')
            report "Failed MUL test";

        A <= "01000000";
        B <= "00000010";
        wait until rising_edge(clk);
        assert (Y = "10000000" and Flags(3) = '1')
            report "Failed MUL test";

        A <= "00001111";
        B <= "00001111";
        wait until rising_edge(clk);
        assert (Y = "11100001" and Flags(3) = '1')
            report "Failed MUL test";

        A <= "00011110";
        B <= "00001111";
        wait until rising_edge(clk);
        assert (Y = "11000010" and Flags(3) = '1')
            report "Failed MUL test";

        assert false report "Finished test" severity failure;
    end process;
end behav;
