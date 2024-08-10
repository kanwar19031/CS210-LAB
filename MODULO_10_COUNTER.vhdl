--author: kanwarraj singh(1903122)
--VHDL code for modulo-10 counter

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE WORK.CS210.ALL;


entity MODULO_10_COUNTER is -- Entity declaration
	port(CLK : in std_logic; -- Clock input of the counter
		  RSTN : in std_logic; -- Active low reset input of the counter
		  Q : BUFFER std_logic_vector(3 downto 0)); -- Output state of the counter
end entity;

architecture FUNCTIONALITY of MODULO_10_COUNTER is 


SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CN:STD_LOGIC;
SIGNAL QN : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CLK_OUT : STD_LOGIC;
SIGNAL RST: STD_LOGIC;

BEGIN
J10 : NOT1 PORT MAP(RSTN,RST);
U5: AND2 PORT MAP(Q(3),Q(2),S(0));
U6: AND2 PORT MAP(Q(3),Q(1),S(1));
U7: OR2 PORT MAP(S(0),S(1),S(2));
U8 : NOT1 PORT MAP(S(2),S(3));
U4 : CLK_DVD_1 PORT MAP(CLK,RSTN,CLK_OUT);
U9: OR2 PORT MAP(S(3),RST,CN);


U0 : D_FF port map(D => QN(0),CLRN => CN,PREN => '1',CLK => CLK_OUT, Q => Q(0),QN => QN(0));
U1 : D_FF PORT MAP(D => QN(1),CLRN => CN,PREN => '1',CLK => QN(0), Q => Q(1),QN => QN(1));
U2 : D_FF PORT MAP(D => QN(2),CLRN => CN,PREN => '1',CLK => QN(1), Q => Q(2),QN => QN(2));
U3 : D_FF PORT MAP(D => QN(3),CLRN => CN,PREN => '1',CLK => QN(2), Q => Q(3),QN => QN(3));

end FUNCTIONALITY;

			