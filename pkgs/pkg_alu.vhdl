library ieee;
use ieee.std_logic_1164.all;

package pkg_alu is
    component alu is
        port(
            A, B: in std_logic_vector(7 downto 0);
            code: in std_logic_vector(2 downto 0);
            Y, flags: out std_logic_vector(7 downto 0);
            clk: in std_logic
        );
    end component;
end package;
