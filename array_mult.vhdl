--Author Kanwarraj singh(1903122)

library IEEE;

use IEEE.std_logic_1164.all;
use work.CS210.all;

entity Array_multiplier is 
	port( X,Y : in std_logic_vector(3 downto 0);
		Z : out std_logic_vector(7 downto 0));
end Array_multiplier;

architecture FUNCTIONALITY of Array_multiplier is

	signal I0, I1, I2, I3, C : std_logic_vector(3 downto 0);
	signal F0, F1, F2 : std_logic_vector(4 downto 0);

begin 
	A0 : AND2 port map(X(0), Y(0), I0(0));
	A1 : AND2 port map(X(1), Y(0), I0(1));
	A2 : AND2 port map(X(2), Y(0), I0(2));
	A3 : AND2 port map(X(3), Y(0), I0(3));
	
	A4 : AND2 port map(X(0), Y(1), I1(0));
	A5 : AND2 port map(X(1), Y(1), I1(1));
	A6 : AND2 port map(X(2), Y(1), I1(2));
	A7 : AND2 port map(X(3), Y(1), I1(3));
	
	C <= ('0', I0(3), I0(2), I0(1));
	FBA0 : FOUR_BIT_ADDER_1 port map(I1,C,'0',F0);
	
	A8 : AND2 port map(X(0),Y(2),I2(0));
	A9 : AND2 port map(X(1),Y(2),I2(1));
	A10 : AND2 port map(X(2),Y(2),I2(2));
	A11 : AND2 port map(X(3),Y(2),I2(3));
	
	FBA1 : FOUR_BIT_ADDER_2 port map(I2, F0(4 downto 1), '0', F1);
	
	A12 : AND2 port map(X(0), Y(3), I3(0));
	A13 : AND2 port map(X(1), Y(3), I3(1));
	A14 : AND2 port map(X(2), Y(3), I3(2));
	A15 : AND2 port map(X(3), Y(3), I3(3));
	
	FBA2 : FOUR_BIT_ADDER_2 port map(I3, F1(4 downto 1), '0', F2);
	
Z <= (F2(4), F2(3), F2(2), F2(1), F2(0), F1(0), F0(0), I0(0));
end FUNCTIONALITY;
