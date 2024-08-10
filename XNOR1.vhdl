--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity XNOR1 is 
	port( A,B : in std_logic;
			f : out std_logic);
end XNOR1;

architecture FUNCTIONALITY of XNOR1 is

signal s0, s1, s2, s3, s4 : std_logic;

begin 

	u0 : NOT1 port map (A,s0);
	u1 : NOT1 port map (B,s1);
	u2 : AND2 port map (A,s1,s2);
	u3 : AND2 port map (B,s0,s3);
	u4 : OR2 port map (s2,s3,s4);
	u5 : NOT1 port map (s4,f);

end FUNCTIONALITY;
