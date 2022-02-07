library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.eor;

use work.pkg_8bit.arr8x8;

use work.pkg_8bit.and_8bit;
use work.pkg_8bit.add_8bit;
use work.pkg_8bit.eor_8bit;

entity mul_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0);
        ovf: out std_logic
    );
end mul_8bit;

architecture ALU2 of mul_8bit is
    type arr7x8 is array (0 to 6) of std_logic_vector(7 downto 0);

    signal signA, signB: std_logic_vector(7 downto 0);
    signal invA, invB: std_logic_vector(7 downto 0);
    signal vect0, vect1: std_logic_vector(7 downto 0);
    signal magA, magB: std_logic_vector(7 downto 0);

    signal B0to7, prod0to7: arr8x8;
    signal shift1to7, sum0to6: arr7x8;
    signal carry: std_logic_vector(6 downto 0);

    signal sign3, inv3, vect3: std_logic_vector(7 downto 0);
    signal o: std_logic;
    signal k: integer := 1;

begin
    eorA: eor_8bit port map (A, signA, invA);
    eorB: eor_8bit port map (A, signB, invB);

    sizeA: add_8bit port map(invA, vect0, magA);
    sizeB: add_8bit port map(invB, vect1, magB);

    gen0: for i in 0 to 7 generate
        prod: and_8bit port map (A, B0to7(i), prod0to7(i));
    end generate;

    fa0: add_8bit port map (prod0to7(0), shift1to7(0), sum0to6(0), carry(0));
    gen1: for i in 1 to 6 generate
        fa: add_8bit port map (sum0to6(i-1), shift1to7(i), sum0to6(i), carry(i));
    end generate;

    signY: eor port map (A(7), B(7), sign3(0));
    eor3: eor_8bit port map (sum0to6(6), sign3, inv3);
    finalProd: add_8bit port map (inv3, vect3, Y);

    process (A, B) begin
        for i in 1 to 7 loop
            signA(i) <= A(7);
            signB(i) <= A(7);
        end loop;

        vect0 <= "00000000"; vect0(0) <= A(7);
        vect1 <= "00000000"; vect1(0) <= B(7);

        for i in 0 to 7 loop
            for j in 0 to 7 loop
                B0to7(i)(j) <= B(i);
            end loop;
        end loop;

        for i in 0 to 6 loop
            shift1to7(i) <= "00000000";
            shift1to7(i)(7 downto (i+1)) <= prod0to7(i+1)((6-i) downto 0);
        end loop;

        for i in 1 to 7 loop
            sign3(i) <= sign3(0);
        end loop;

        vect3 <= "00000000"; vect3(0) <= sign3(0);
        for i in 0 to 6 loop
            for j in 0 to 6 loop
                if (j < k) then
                    o <= o or carry(i) or prod0to7(i)(7-j);
                else
                    next;
                end if;
            end loop;
            k <= k + 1;
        end loop;
        ovf <= o;
    end process;
end ALU2;
