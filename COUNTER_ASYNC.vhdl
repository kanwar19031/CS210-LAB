--author: Kanwarraj Singh(1903122)
--vhdl code for asynchronus counter 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.CS210.all;


entity COUNTER_ASYNC is -- Entity declaration
	port(CLK : in std_logic; -- Clock input of the counter
		  RSTN : in std_logic; -- Active low reset input of the counter
		  Q : inout std_logic_vector(3 downto 0)); -- Output state of the counter
end entity;

architecture FUNCTIONALITY of COUNTER_ASYNC is 

SIGNAL QN : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CLK_OUT : STD_LOGIC;
BEGIN


U4 : CLK_DVD_1 PORT MAP(CLK,RSTN,CLK_OUT);
U0 : D_FF port map(D => QN(0),CLRN => RSTN,PREN => '1',CLK => CLK_OUT, Q => Q(0),QN => QN(0));
U1 : D_FF PORT MAP(D => QN(1),CLRN => RSTN,PREN => '1',CLK => QN(0), Q => Q(1),QN => QN(1));
U2 : D_FF PORT MAP(D => QN(2),CLRN => RSTN,PREN => '1',CLK => QN(1), Q => Q(2),QN => QN(2));
U3 : D_FF PORT MAP(D => QN(3),CLRN => RSTN,PREN => '1',CLK => QN(2), Q => Q(3),QN => QN(3));


end FUNCTIONALITY;

			