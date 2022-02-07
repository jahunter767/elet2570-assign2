library ieee;
use ieee.std_logic_1164.all;

entity eor is
    port(
        a, b: in std_logic;
        y: out std_logic
    );
end eor;

architecture ALU2 of eor is
begin
    process (a, b) begin
        y <= (a and (not b)) or ((not a) and b);
    end process;
end ALU2 ;
