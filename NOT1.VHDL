--Author Kanwarraj Singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;

entity NOT1 is
port(	A : in std_logic;
		B : out std_logic);
end entity;

architecture fnc of NOT1 is

begin
	B <= NOT A;

end fnc;