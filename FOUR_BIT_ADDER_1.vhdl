--Author Kanwarraj singh(1903122)
--VHDL Program for Four Bit Adder.

library IEEE;					--Library declaration 

use IEEE.std_logic_1164.all;			--use std_logic_1164 from IEEE Library 
use work.CS210.all;				--use cs210 package 

entity FOUR_BIT_ADDER_1 is						--Entity Declaration
	port (A : in std_logic_vector(3 downto 0);		-- First Input 
		B : in std_logic_vector(3 downto 0);		--Second Input
		Cin : in std_logic;				--Carry into the first bit
		Sum : out std_logic_vector(4 downto 0));		--5 Bit Output
end FOUR_BIT_ADDER_1;

architecture STRUCTURE of FOUR_BIT_ADDER_1 is			--

signal c1,c2,c3 : std_logic;

begin 
	HA1 : HALF_ADDER port map (A(0),B(0),Sum(0),C1);
	FA2 : FULL_ADDER port map (A(1),B(1),C1,Sum(1),C2);
	FA3 : FULL_ADDER port map (A(2),B(2),C2,Sum(2),C3);
	HA2 : HALF_ADDER port map (A(3),B(3),Sum(3),Sum(4));
	
end STRUCTURE;