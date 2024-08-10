--Author Kanwarraj singh(1903122)
--VHDL Program for Full Adder.

library IEEE;					--Library declaration 

use IEEE.std_logic_1164.all;			--use std_logic_1164 from IEEE Library 
use work.CS210.all;				--use cs210 package 

entity FULL_ADDER is 				--Entity declaration for Full adder
	port ( A,B,Cin : in std_logic;		--Input of the Full adder
		 S,Cout : out std_logic);		--Output of Full adder
end FULL_ADDER;					

architecture structure of FULL_ADDER is			--Architecture Description of Full adder
 
signal S0,C0,C1 : std_logic;
begin 								--Installation of 2 Half Adder and OR gate
	HA0 : HALF_ADDER port map (A,B,S0,C0);
	HA1 : HALF_ADDER port map (S0,Cin,S,C1);
	U0 : OR2 port map (C0,C1,Cout);
end structure;