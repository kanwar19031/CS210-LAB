--Author Kanwarraj Singh(1903122)
--VHDL Code for sync counter. output will be from 0 - 15.
LIBRARY IEEE;
USE IEEE.STD_logic_1164.ALL;
USE WORK.CS210.ALL;

entity COUNTER_SYNC is                                  -- Entity declaration
	port(CLK   : in std_logic;                        -- Clock input of the counter
		  RSTN  : in std_logic;                        -- Active low reset input of the counter
		  UP_DN : in std_logic;                        -- Count up if UP_DN is high and down if low
		  Q     : BUFFER std_logic_vector(3 downto 0));   -- Output state of the counter
end entity;

ARCHITECTURE STRUCTURE OF COUNTER_SYNC IS

SIGNAL Z0, Z1, Z2, Z3 : STD_logic;
SIGNAL C0, C1, C2, C3 : STD_logic;
SIGNAL A0, B0, W0, A1, B1, W1, A2, B2, W2, A3, B3, W3 : STD_logic;

SIGNAL T0, T1, T2, T3 : STD_logic;

BEGIN

U0 : XOR2 PORT MAP (RSTN, Q(0), Z0);
FF0 : D_FF PORT MAP (Z0, CLK, T2, T0, Q(0), B0);
M0 : MUX_2x1 PORT MAP (B0, Q(0), UP_DN, W0);
U1 : AND2 PORT MAP (RSTN, W0, C0);

U2 : XOR2 PORT MAP (C0, Q(1), Z1);
FF1 : D_FF PORT MAP (Z1, CLK, T2, T0, Q(1), B1);
M1 : MUX_2x1 PORT MAP (B1, Q(1), UP_DN, W1);
U3 : AND2 PORT MAP (C0, W1, C1);

U4 : XOR2 PORT MAP (C1, Q(2), Z2);
FF2 : D_FF PORT MAP (Z2, CLK, T2, T0, Q(2), B2);
M2 : MUX_2x1 PORT MAP (B2, Q(2), UP_DN, W2);
U5 : AND2 PORT MAP (C1, W2, C2);

U6 : XOR2 PORT MAP (C2, Q(3), Z3);
FF3 : D_FF PORT MAP (Z3, CLK, T2, T0, Q(3), B3);
M3 : MUX_2x1 PORT MAP (B3, Q(3), UP_DN, W3);
U7 : AND2 PORT MAP (C2, W3, C3);

U8 : OR2  PORT MAP (RSTN, UP_DN, T0);
U9 : NOT2 PORT MAP (UP_DN, T1);
U10 : OR2  PORT MAP (RSTN, T1, T2);

END STRUCTURE;