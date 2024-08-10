--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity MUX_4x1 is 
	port( A : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		f : out std_logic);
end MUX_4x1;

architecture FUNCTIONALITY of MUX_4x1 is

signal f0, f1: std_logic;

begin 

	u0 : MUX_2x1 port map (A(0),A(1),S(0),f0);
	u1 : MUX_2x1 port map (A(2),A(3),S(0),f1);
	u2 : MUX_2x1 port map (f0,f1,S(1),f);

end FUNCTIONALITY;
