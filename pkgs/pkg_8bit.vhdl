library ieee;
use ieee.std_logic_1164.all;

package pkg_8bit is
    type arr8x8 is array (0 to 7) of std_logic_vector(7 downto 0);
    type arr4x8 is array (0 to 3) of std_logic_vector(7 downto 0);
    type arr2x8 is array (0 to 1) of std_logic_vector(7 downto 0);

    component reg_8bit is
        port(
            D: in std_logic_vector(7 downto 0);
            Q: out std_logic_vector(7 downto 0);
            clk: in std_logic
        );
    end component;

    component and_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0)
        );
    end component;

    component or_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0)
        );
    end component;

    component not_8bit is
        port(
            A: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0)
        );
    end component;

    component eor_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0)
        );
    end component;

    component add_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0);
            carry: out std_logic
        );
    end component;

    component sub_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0);
            carry: out std_logic
        );
    end component;

    component mul_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            Y: out std_logic_vector(7 downto 0);
            ovf: out std_logic
        );
    end component;
    component comp_8bit is
        port(
            A, B: in std_logic_vector(7 downto 0);
            y: out std_logic
        );
    end component;

    component mux8to1_8bit is
        port(
            --D0, D1, D2, D3, D4, D5, D6, D7: in std_logic_vector(7 downto 0);
            D: in arr8x8;
            S: in std_logic_vector(2 downto 0);
            Y: out std_logic_vector(7 downto 0)
        );
    end component;
end package;
