library ieee;
use ieee.std_logic_1164.all;

use work.pkg_8bit.arr8x8;
use work.pkg_8bit.arr4x8;
use work.pkg_8bit.arr2x8;

use work.pkg_8bit.and_8bit;
use work.pkg_8bit.or_8bit;

entity mux8to1_8bit is
    port(
        D: in arr8x8;
        S: in std_logic_vector(2 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end mux8to1_8bit;

architecture ALU2 of mux8to1_8bit is
    signal L1, S0to7: arr8x8; --I0-7, S0-7
    signal L2: arr4x8;
    signal L3: arr2x8;

begin
    gen0: for i in 0 to 7 generate
        dec: and_8bit port map (S0to7(i), D(i), L1(i));
    end generate;

    gen1: for i in 0 to 3 generate
        or0: or_8bit port map (L1(2*i), L1(2*i +1), L2(i));
    end generate;

    gen2: for i in 0 to 1 generate
        or1: or_8bit port map (L2(2*i), L2(2*i +1), L3(i));
    end generate;

    or2: or_8bit port map (L3(0), L3(1), Y);

    process (S) begin
        S0to7(0)(0) <= (not S(2)) and (not S(1)) and (not S(0));
        S0to7(1)(0) <= (not S(2)) and (not S(1)) and S(0);
        S0to7(2)(0) <= (not S(2)) and S(1) and (not S(0));
        S0to7(3)(0) <= (not S(2)) and S(1) and S(0);
        S0to7(4)(0) <= S(2) and (not S(1)) and (not S(0));
        S0to7(5)(0) <= S(2) and (not S(1)) and S(0);
        S0to7(6)(0) <= S(2) and S(1) and (not S(0));
        S0to7(7)(0) <= S(2) and S(1) and S(0);

        for i in 0 to 7 loop
            for j in 1 to 7 loop
                S0to7(i)(j) <= S0to7(i)(0);
            end loop;
        end loop;
    end process;
end ALU2;