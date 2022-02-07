library ieee;
use ieee.std_logic_1164.all;

package pkg_1bit is
    component eor is
        port(
            a, b: in std_logic;
            y: out std_logic
        );
    end component;

    component fullAdder is
        port(
            a, b, c: in std_logic;
            sum, carry: out std_logic
        );
    end component;

    component dFlipFlop is
        port(
            d: in std_logic;
            q: out std_logic;
            clk: in std_logic
        );
    end component;
end package;