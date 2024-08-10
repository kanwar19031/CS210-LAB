--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity DEMUX_1x2 is 
	port( A,S: in std_logic;
			f1,f2 : out std_logic);
end DEMUX_1x2;

architecture FUNCTIONALITY of DEMUX_1x2 is

signal s0 : std_logic;

begin 

	u0 : NOT1 port map (S,s0);
	u1 : AND2 port map (A,S,f1);
	u2 : AND2 port map (A,s0,f2);

end FUNCTIONALITY;
