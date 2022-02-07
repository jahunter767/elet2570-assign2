library ieee;
use ieee.std_logic_1164.all;

entity not_8bit is
    port(
        A: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end not_8bit;

architecture ALU2 of not_8bit is
begin
    gen0: for i in 0 to 7 generate
        Y(i) <= not A(i);
    end generate;
end ALU2;
