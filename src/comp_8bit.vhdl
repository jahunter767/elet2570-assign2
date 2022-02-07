library ieee;
use ieee.std_logic_1164.all;

use work.pkg_8bit.eor_8bit;

entity comp_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        y: out std_logic
    );
end comp_8bit;

architecture ALU2 of comp_8bit is
    signal yVect: std_logic_vector(7 downto 0);
begin
    eor8b0: eor_8bit port map (A, B, yVect);
    process (A, B) begin
        y <= not (yVect(0) or yVect(1) or yVect(2) or yVect(3) or
            yVect(4) or yVect(5) or yVect(6) or yVect(7));
    end process;
end ALU2;
