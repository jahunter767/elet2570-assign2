library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.all;
use work.pkg_8bit.all;
use work.pkg_alu.all;

entity test is
end test;

architecture behav of test is
    signal A, B, Y, Flags: std_logic_vector(7 downto 0);
    signal code: std_logic_vector(2 downto 0);
    signal clk: std_logic := '0';

begin
    alu0: alu port map (A, B, code, Y, Flags, clk);

    -- Clock
    clk <= not clk after 1 ns;

    -- Testing
    process begin
        report "Starting test";
        wait until rising_edge(clk);

        -------------------------------------------
        --------------------and--------------------
        -------------------------------------------

        report "Starting AND tests";

        code <= "000"; -- and
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000000")
            report "Failed AND test";

        code <= "000"; -- and
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed AND test";

        code <= "000"; -- and
        A <= "00010000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000000")
            report "Failed AND test";

        code <= "000"; -- and
        A <= "00010000";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000000")
            report "Failed AND test";

        -------------------------------------------
        ---------------------or--------------------
        -------------------------------------------

        report "Starting OR tests";

        code <= "001"; -- or
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed OR test";

        code <= "001"; -- or
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed OR test";

        code <= "001"; -- or
        A <= "00010000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00010001" and Flags = "00000000")
            report "Failed OR test";

        code <= "001"; -- or
        A <= "00010000";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "00010000" and Flags = "00000000")
            report "Failed OR test";

        -------------------------------------------
        --------------------eor--------------------
        -------------------------------------------

        report "Starting EOR tests";

        code <= "010"; -- eor
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed EOR test";

        code <= "010"; -- eor
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000000")
            report "Failed EOR test";

        code <= "010"; -- eor
        A <= "00010000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00010001" and Flags = "00000000")
            report "Failed EOR test";

        code <= "010"; -- eor
        A <= "00010000";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "00010000" and Flags = "00000000")
            report "Failed EOR test";

        -------------------------------------------
        --------------------not--------------------
        -------------------------------------------

        report "Starting NOT tests";

        code <= "011"; -- not
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags = "00000000")
            report "Failed NOT test";

        code <= "011"; -- not
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111110" and Flags = "00000000")
            report "Failed NOT test";

        code <= "011"; -- not
        A <= "00010000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11101111" and Flags = "00000000")
            report "Failed NOT test";

        code <= "011"; -- not
        A <= "00010000";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "11101111" and Flags = "00000000")
            report "Failed NOT test";

        -------------------------------------------
        --------------------add--------------------
        -------------------------------------------

        report "Starting ADD tests";

        code <= "100"; -- add
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed ADD test";

        code <= "100"; -- add
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000010" and Flags = "00000000")
            report "Failed ADD test";

        code <= "100"; -- add
        A <= "10000001";
        B <= "10000001";
        wait until rising_edge(clk);
        assert (Y = "00000010" and Flags = "00001100")
            report "Failed ADD test";

        code <= "100"; -- add
        A <= "01000001";
        B <= "01000001";
        wait until rising_edge(clk);
        assert (Y = "10000010" and Flags = "00001001")
            report "Failed ADD test";

        -------------------------------------------
        --------------------sub--------------------
        -------------------------------------------

        report "Starting SUB tests";

        code <= "101"; -- sub
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags = "00001101")
            report "Failed SUB test";

        code <= "101"; -- sub
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000010")
            report "Failed SUB test";

        code <= "101"; -- sub
        A <= "10000001";
        B <= "10000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00001010")
            report "Failed SUB test";

        code <= "101"; -- sub
        A <= "01000001";
        B <= "01000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000010")
            report "Failed SUB test";

        -------------------------------------------
        --------------------mul--------------------
        -------------------------------------------

        report "Starting MUL tests";

        code <= "110"; -- mul
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000010")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "00000001";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "00000001" and Flags = "00000000")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "01000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "01000000" and Flags = "00000000")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "10000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "10000000" and Flags = "00001001")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "10000000";
        B <= "00000010";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00001010")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "01000000";
        B <= "00000010";
        wait until rising_edge(clk);
        assert (Y = "10000000" and Flags = "00001001")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "00001111";
        B <= "00001111";
        wait until rising_edge(clk);
        assert (Y = "11100001" and Flags = "00001001")
            report "Failed MUL test";

        code <= "110"; -- mul
        A <= "00011110";
        B <= "00001111";
        wait until rising_edge(clk);
        assert (Y = "11000010" and Flags = "00001001")
            report "Failed MUL test";

        -------------------------------------------
        --------------------comp-------------------
        -------------------------------------------

        report "Starting COMP tests";

        code <= "111"; -- comp
        A <= "00000000";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags = "00000000")
            report "Failed COMP test";

        code <= "111"; -- comp
        A <= "00000010";
        B <= "00000001";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags = "00000000")
            report "Failed COMP test";

        code <= "111"; -- comp
        A <= "00000010";
        B <= "00000000";
        wait until rising_edge(clk);
        assert (Y = "11111111" and Flags = "00000000")
            report "Failed COMP test";

        code <= "111"; -- comp
        A <= "10000000";
        B <= "10000000";
        wait until rising_edge(clk);
        assert (Y = "00000000" and Flags = "00000010")
            report "Failed COMP test";

        report "Test Complete" severity failure;
        wait;
    end process;
end behav;
