library ieee;
use ieee.std_logic_1164.all;

entity dFlipFlop is
    port(
        d, clk: in std_logic;
        q: out std_logic
    );
end dFlipFlop;

architecture ALU2 of dFlipFlop is
begin
    process (clk) begin
        if rising_edge(clk) then
        --if ((clk = '1') and clock'event) then
            q <= d;
        end if;
    end process;

end ALU2;
