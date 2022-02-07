library ieee;
use ieee.std_logic_1164.all;

use work.pkg_1bit.eor;

entity eor_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end eor_8bit;

architecture ALU2 of eor_8bit is
begin
    gen0: for i in 0 to 7 generate
        eor0: eor port map (A(i), B(i), Y(i));
    end generate;
end ALU2;
