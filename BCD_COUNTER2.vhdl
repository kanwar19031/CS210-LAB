--Author Kanwarraj Singh(1903122)
--VHDL Code for sync counter. output will be from 0 - 9.
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.CS210.ALL;

entity BCD_COUNTER2 is                              -- Entity declaration
	port(CLK : in std_logic;                        -- Clock input of the counter
		  RSTN : in std_logic;                       -- Active low reset input of the counter
		  UP_DN : in std_logic;                      -- Count up if UP_DN is high and down if low
		  Q : inout std_logic_vector(3 downto 0));   -- Output state of the counter
end entity;

ARCHITECTURE STRUCTURE OF BCD_COUNTER2 IS 
	signal Q0, Q1, Q2, Q3, K , L: std_logic;
	SIGNAL B0, B1, B2, B3 : STD_logic;
	SIGNAL C0, C1, C2, C3 : STD_logic;
	SIGNAL D0, D1, D2, D3 : STD_logic;
	SIGNAL Z0, Z1, Z2, Z3 : STD_logic;	
	SIGNAL Y0, Y1, Y2, Y3 : STD_logic;
	SIGNAL S0, S1, S2, S3 : STD_logic;
	SIGNAL T0, T1, T2, T3 : STD_logic;
	SIGNAL I6, I7 : STD_logic;
	
BEGIN

	K <= (not(Q3)) or ((not(Q2)) and (not(Q1)));
	L <= RSTN and K;


	U0 : XOR2 PORT MAP (RSTN, Q0, Z0);
	FF0 : D_FF PORT MAP (Z0, CLK, L, '1', Q0, B0);
	U1 : AND2 PORT MAP (RSTN, Q0, C0);

	U2 : XOR2 PORT MAP (C0, Q1, Z1);
	FF1 : D_FF PORT MAP (Z1, CLK, L, '1', Q1, B1);
	U3 : AND2 PORT MAP (C0, Q1, C1);

	U4 : XOR2 PORT MAP (C1, Q2, Z2);
	FF2 : D_FF PORT MAP (Z2, CLK, L, '1', Q2, B2);
	U5 : AND2 PORT MAP (C1, Q2, C2);

	U6 : XOR2 PORT MAP (C2, Q3, Z3);
	FF3 : D_FF PORT MAP (Z3, CLK, L, '1', Q3, B3);
	U7 : AND2 PORT MAP (C2, Q3, C3);

	process (L, I6, I7)
	begin 
		if L = '0' then
			I6 <= '0';
			I7 <= '0';
		else
			I6 <= '1';
			I7 <= '1';
		end if;
		end process;

	U8 : XOR2 PORT MAP (RSTN, S0, Y0);
	FF4 : D_FF PORT MAP (Y0, CLK, '1', L, S0, T0);
	U9 : AND2 PORT MAP (RSTN, T0, D0);

	U10 : XOR2 PORT MAP (D0, S1, Y1);
	FF5 : D_FF PORT MAP (Y1, CLK, I6, L, S1, T1);
	U11 : AND2 PORT MAP (D0, T1, D1);

	U12 : XOR2 PORT MAP (D1, S2, Y2);
	FF6 : D_FF PORT MAP (Y2, CLK, I7, L, S2, T2);
	U13 : AND2 PORT MAP (D1, T2, D2);

	U14 : XOR2 PORT MAP (D2, S3, Y3);
	FF7 : D_FF PORT MAP (Y3, CLK, '1', L, S3, T3);
	U15 : AND2 PORT MAP (D2, T3, D3);


	M1 : MUX_2x1 port map( S0, Q0, UP_DN, Q(0));
	M2 : MUX_2x1 port map( S1, Q1, UP_DN, Q(1));
	M3 : MUX_2x1 port map( S2, Q2, UP_DN, Q(2));
	M4 : MUX_2x1 port map( S3, Q3, UP_DN, Q(3));

END STRUCTURE;