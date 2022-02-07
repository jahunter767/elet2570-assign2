library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.eor;

entity fullAdder is
    port(
        a, b, c: in std_logic;
        sum, carry: out std_logic
    );
end fullAdder;

architecture ALU2 of fullAdder is
    signal s0, c0, c1: std_logic;
begin
    eor0: eor port map (a, b, s0);
    eor1: eor port map (s0, c, sum);
    process (a, b, c) begin
        carry <= (s0 and c) or (a and b);
    end process;
end ALU2 ;
