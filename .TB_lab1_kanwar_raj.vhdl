-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity TB_lab1_kanwar_raj is

end entity; 

architecture TESTBENCH of TB_lab1_kanwar_raj is 
	component D_lab1_kanwar_raj is
	port(	a: in std_logic;
  		b: in std_logic;
  		c: out std_logic);
	end component;
	
	signal A,B,C : std_logic;
begin 
	DUT : D_lab1_kanwar_raj port map (A,B,C);
	process 
	begin 
		A <= '0'; 
		B <= '0'; 
		wait for 1 ns;

		A <= '0'; 
		B <= '1'; 
		wait for 1 ns;

		A <= '1'; 
		B <= '0'; 
		wait for 1 ns;

		A <= '1'; 
		B <= '1'; 
		wait for 1 ns;

		A <= '0'; 
		B <= '0'; 
		wait;
	end process; 
end TESTBENCH;