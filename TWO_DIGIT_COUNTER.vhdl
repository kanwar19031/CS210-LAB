library ieee;															--library declaration
use ieee.std_logic_1164.all;										--use std_logic_1164 package from ieee library
use ieee.std_logic_unsigned.all;

entity TWO_DIGIT_COUNTER is 										-- Entity declaration
	port(CLK : in std_logic; 										-- Clock input of the counter
		  RSTN : in std_logic; 										-- Active low reset input of the counter
		  UP_DN : in std_logic; 									-- Count up if UP_DN is high and down if low
		  D1 : in std_logic_vector(3 downto 0); 				-- Upper digit input
		  D0 : in std_logic_vector(3 downto 0); 				-- Lower digit input
		  LDN : in std_logic; 										-- Active low load signal
		  Q1 : inout std_logic_vector(3 downto 0); 			-- Upper digit output of counter
		  Q0 : inout std_logic_vector(3 downto 0)); 			-- Lower digit output of counter
end entity;
	
architecture STRUCTURE of TWO_DIGIT_COUNTER is			

	signal tmp,tmp1: std_logic_vector(3 downto 0);			
	
begin

	process(CLK,RSTN)
	begin
	
		if(RSTN='0' and UP_DN='1' and LDN='1') then   		
			tmp<="0000";
			tmp1<="0000";
			
		elsif(RSTN='0' and UP_DN='0' and LDN='1') then  	
			tmp<="1001";
			tmp1<="1001";
			
		elsif(LDN='0') then
			tmp<=D0;
			tmp1<=D1;
			
		elsif(CLK'event and CLK='1') then
		
			if(UP_DN='1' and (tmp1(3) and (tmp1(2) or tmp1(1) or tmp1(0)))='0') then  
				
				if(UP_DN='1' and (tmp(3) and (tmp(2) or tmp(1) or tmp(0)))='0') then  
					tmp<=tmp+1;
					
				else
					tmp1<=tmp1+1;
					tmp<="0000";
				end if;
				
			elsif(UP_DN='0' and (tmp1(3) and (tmp1(2) or tmp1(1)))='0') then  
			
				if(UP_DN='0' and (tmp(3) and (tmp(2) or tmp(1)))='0') then    
					
					if (tmp = "0000") then
						tmp <="1001";
						tmp1<=tmp1-1;
						
					else
						tmp<=tmp-1;
					end if;
					
				else
					tmp1<=tmp1-1;
				   tmp<="1001";
				end if;
			end if;	
		end if;	
	end process;
	
	Q0 <= tmp;
	Q1<=tmp1;
	
end STRUCTURE;