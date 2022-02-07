library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.dFlipFlop;

entity reg_8bit is
    port (
        D: in std_logic_vector(7 downto 0);
        Q: out std_logic_vector(7 downto 0);
        clk: in std_logic
    );
end reg_8bit;

architecture ALU2 of reg_8bit is
begin
    gen0: for i in 1 to 7 generate
        dff: dFlipFlop port map (D(i), Q(i), clk);
    end generate;
end ALU2;
