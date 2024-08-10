--Author Kanwarraj singh(1903122)
--VHDL Program for Half Adder.

library IEEE;					--Library declaration 

use IEEE.std_logic_1164.all;			--use std_logic_1164 from IEEE Library 
use work.CS210.all;				--use cs210 package 

entity HALF_ADDER is 				--Entity declaration for half adder
	port ( A,B : in std_logic;		--Input of the half adder
		 s,c : out std_logic);		--Output of half adder
end HALF_ADDER;					

architecture structure of HALF_ADDER is	--Architecture Description of Half adder
begin 						--Installation of Various gate
	U0 : XOR2 port map (A,B,s);
	U1 : AND2 port map (A,B,c);
end structure;