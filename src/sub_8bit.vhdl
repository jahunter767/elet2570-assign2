library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.fullAdder;
use work.pkg_8bit.not_8bit;

entity sub_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0);
        carry: out std_logic
    );
end sub_8bit;

architecture ALU2 of sub_8bit is
    signal c: std_logic_vector(8 downto 0);
    signal Bbar: std_logic_vector(7 downto 0);
begin
    not8b0: not_8bit port map (B, Bbar);

    c(0) <= '1';
    gen0: for i in 0 to 7 generate
        fa: fullAdder port map (A(i), Bbar(i), c(i), Y(i), c(i+1));
    end generate;
    carry <= not c(8);
end ALU2;
