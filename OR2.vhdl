--Author Kanwarraj Singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;

entity OR2 is
port(	A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end entity;

architecture fnc of OR2 is


begin
	C <= A OR B;

end fnc;
