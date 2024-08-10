--Author Kanwarraj singh (1903122)
--Vhdl code for SR LATCH.

library IEEE;
use IEEE.std_logic_1164.all;

entity SR_LATCH is 					-- Entity declaration 
		port( S : in std_logic; 		-- Set input of the SR latch 
        	R : in std_logic; 			-- Reset input of the SR latch 
         	Q : buffer std_logic; 			-- Q output of the SR latch 
            QN : out std_logic); 			-- Q_bar output of the SR latch 
end SR_LATCH;

architecture func of SR_LATCH is 
begin 

process(S,R)

begin

	if S = '1' and R = '0' then
		Q <= '1';
	eLsif S = '0' and R = '1'then
		Q <= '0';
	elsif S ='0' and R = '0' then
		Q <= '1';
	elsif S = '1' and R = '1'then
		Q <= Q;
	end if;

end process;


QN <= not Q;


end func;
	

