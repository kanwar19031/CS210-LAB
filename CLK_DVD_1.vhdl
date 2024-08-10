--author: kanwarraj singh(1903122)
--vhdl code for clock divider

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CLK_DVD_1 is
	port(CLK_IN : in std_logic; -- Input clock
		  RSTN : in std_logic; -- Active low reset
		  CLK_OUT : out std_logic); -- Output clock
end entity;

architecture FUNCTIONALITY of CLK_DVD_1 is
	signal CNT : integer := 1;
	signal TEMP : std_logic := '0' ;

begin

	process(CLK_IN, RSTN)
	begin

		if (RSTN = '0') then
			CNT <= 1 ;
			TEMP <= '0' ;
		elsif (CLK_IN'event and CLK_IN = '1') then
			CNT <= CNT+1;
			if (CNT = 150000000) then
				TEMP <= not TEMP;
				CNT <= 1;
			end if;
		end if;
		CLK_OUT <= TEMP;
	end process;
end architecture;