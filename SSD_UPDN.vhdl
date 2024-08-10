library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity SSD_UPDN is
		port( CLK : in std_logic; -- Clock input of the counter
			RSTN : in std_logic; -- Active low reset input of the counter
	      	UP_DN : in std_logic; -- Count up if UP_DN is high, down if low
		      STOP : in std_logic; -- Count if ~STOP=E is high, retain otherwise
	     		Y : out std_logic_vector(6 downto 0)); -- Output SSD code

end SSD_UPDN;

architecture STRUCTURAL of SSD_UPDN is

signal P1,P2,P3 : std_logic;	
signal P4: std_logic_vector(3 downto 0);

begin
	
	N0 : NOT1 port map(STOP,P1);
	CLK0 : CLK_DVD_1 port map(CLK,RSTN,P3);   --S3 is the actual clock for ssd 3second counter
	CS0 : COUNTER_SYNCR port map(CLK=>CLK,RSTN=>RSTN,UP_DN=>UP_DN,LDN=>'1',E=>P1,D=>"0000",Q=>P4);
	BCD : BCD2SSD port map(P4,Y,P2);

end architecture;