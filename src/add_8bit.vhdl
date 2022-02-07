library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.fullAdder;

entity add_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0);
        carry: out std_logic
    );
end add_8bit;

architecture ALU2 of add_8bit is
    signal c: std_logic_vector(7 downto 0);
begin
    c(0) <= '0';
    gen0: for i in 0 to 6 generate
        fa: fullAdder port map (A(i), B(i), c(i), Y(i), c(i+1));
    end generate gen0;
    fa7: fullAdder port map (A(7), B(7), c(7), Y(7), carry);
end ALU2;
