--Author Kanwarraj singh(1903122)
--VHDL Code for Negative  edge trigered D Flip-Flop.

library IEEE;
use IEEE.std_logic_1164.all;


entity D_FFN is 					-- Entity declaration 
        port( D : in std_logic; 		-- Data input of the D flipflop 
        CLK : in std_logic; 			-- Clock input of the D flipflop 
        CLRN : in std_logic; 			-- Active low clear input of the D flipflop 
        PREN : in std_logic; 			-- Active low preset input of the D flipflop 
        Q : buffer std_logic; 		-- Q output of the D flipflop 
        QN : out std_logic); 			-- Q_bar output of the D flipflop 
end D_FFN;

architecture func of D_FFN is 
begin 
	process(CLRN,PREN,CLK)
	begin 
		if CLRN <= '0' then
			Q <= '0';
		elsif PREN <= '0' then 
			Q <= '1';
		elsif CLK'event and CLK <= '0' then 
			Q <= D;
		end if;
	end process;
	QN <= not Q;
end func;