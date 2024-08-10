--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity DEMUX_1x4 is 
	port( A : in std_logic;
		S : in std_logic_vector(1 downto 0);
			f : out std_logic_vector(3 downto 0));
end DEMUX_1x4;

architecture FUNCTIONALITY of DEMUX_1x4 is

signal I0,I1: std_logic;

begin 

	u0 : DEMUX_1x2 port map (A,S(0),I0,I1);
	u1 : DEMUX_1x2 port map (I0,S(1),f(0),f(1));
	u2 : DEMUX_1x2 port map (I1,S(1),f(2),f(3));

end FUNCTIONALITY;
