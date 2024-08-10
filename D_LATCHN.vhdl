--Author Kanwarraj singh(1903122)
--VHDL Code for Negative level trigered D-Latch.

library IEEE;
use IEEE.std_logic_1164.all;

entity D_LATCHN is                               -- Entity declaration 
		port( D : in std_logic;       	-- Data input of the D latch 
        		LTCHN : in std_logic; 		-- Latch input of the D latch 
                	Q : buffer std_logic; 		-- Q output of the D latch 
                	QN : out std_logic); 		-- Q_bar output of the D latch 
end D_LATCHN;

architecture func of D_LATCH is 
	process(D,LTCH)
	begin
		if LTCHN = '0' then 
    		Q <= D;
    		end if;
    end process;
    QN <= not Q;
end func;