--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity MUX_2x1 is 
	port( A,B,S: in std_logic;
			f : out std_logic);
end MUX_2x1;

architecture FUNCTIONALITY of MUX_2x1 is

signal s0, s1, s2 : std_logic;

begin 

	u0 : NOT1 port map (S,s0);
	u1 : AND2 port map (A,s0,s1);
	u2 : AND2 port map (B,S,s2);
	u3 : OR2 port map (s1,s2,f);

end FUNCTIONALITY;
