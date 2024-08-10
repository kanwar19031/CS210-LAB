library IEEE;
use IEEE.STD_LOGIC_1164.ALl;
use IEEE.NUMERIC_STD.ALL;

entity MULT is 
	port ( Nibble1,Nibble2 : in std_logic_vector(3 downto 0);
		Result : out std_logic_vector(7 downto 0));
end MULT;

architecture fnc of MULT is
begin 
	Result <= std_logic_vector(unsigned(Nibble1)*unsigned(Nibble2));
end fnc;