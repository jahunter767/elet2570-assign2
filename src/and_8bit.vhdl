library ieee;
use ieee.std_logic_1164.all;

entity and_8bit is
    port(
        A, B: in std_logic_vector(7 downto 0);
        Y: out std_logic_vector(7 downto 0)
    );
end and_8bit;

architecture ALU2 of and_8bit is
begin
    gen0: for i in 0 to 7 generate
        Y(i) <= A(i) and B(i);
    end generate;
end ALU2;
