library ieee;
use ieee.std_logic_1164.all;

use work.pkg_8bit.all;

entity alu is
    port(
        A, B: in std_logic_vector(7 downto 0);
        code: in std_logic_vector(2 downto 0);
        Y, flags: out std_logic_vector(7 downto 0);
        clk: in std_logic
    );
end alu;

architecture ALU2 of alu is
    signal regA, regB, regY: std_logic_vector(7 downto 0);
    signal D, F: arr8x8;
    signal neg, zero, carry1, carry2, ovf1, ovf2: std_logic;
    signal signA, signB, comp: std_logic;

begin
    aReg: reg_8bit port map (A, regA, clk);
    bReg: reg_8bit port map (B, regB, clk);
    yReg: reg_8bit port map (regY, Y, clk);

    and0: and_8bit port map (regA, regB, D(0));
    or0: or_8bit port map (regA, regB, D(1));
    eor0: eor_8bit port map (regA, regB, D(2));
    not0: not_8bit port map (regA, D(3));
    add0: add_8bit port map (regA, regB, D(4), carry1);
    sub0: sub_8bit port map (regA, regB, D(5), carry2);
    mul0: mul_8bit port map (regA, regB, D(6), ovf2);
    comp0: comp_8bit port map (regA, regB, comp);

    mux0: mux8to1_8bit port map (D, code, regY);

    comp1: comp_8bit port map (regY, "00000000", zero);
    mux1: mux8to1_8bit port map (F, code, flags);

    process (clk) begin
        D(7)(0) <= not comp;
        for i in 1 to 7 loop
            D(7)(i) <= D(7)(0);
        end loop;

        neg <= regY(7);
        ovf1 <= ((not neg) and signA and signB) or 
                (neg and (not signA) and (not signB));

        for i in 0 to 7 loop
            F(i) <= "00000000";
        end loop;

        F(4)(0) <= neg;
        F(4)(1) <= zero;
        F(4)(2) <= carry1;
        F(4)(3) <= ovf1;

        F(5)(0) <= neg;
        F(5)(1) <= zero;
        F(5)(2) <= carry2;
        F(5)(3) <= ovf1;

         F(6)(0) <= neg;
         F(6)(1) <= zero;
         F(6)(3) <= ovf1;

        F(7)(1) <= zero;
    end process;
end ALU2;
