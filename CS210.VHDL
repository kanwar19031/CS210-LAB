                            --Author Kanwarraj Singh(1903122)
--CS210 PACKAGE Having NOT Gate, OR Gate, AND Gate, XOR Gate, Half Adder, Full adder, 2x1 Multiplexer.

library IEEE;

use IEEE.std_logic_1164.all;

package CS210 is 
	
	component NOT1 is						--Entity declaration for NOT Gate
		port(	A : in std_logic;				--Input of the NOT Gate
				B : out std_logic);		--Output of NOT GATE
	end component;
	
	component OR2 is 
		port(	A : in std_logic;				--Entity declaration for OR Gate
			B : in std_logic;				--Input of the OR GATE
			C : out std_logic);			--Output of OR GATE
	end component;

	component AND2 is
		port(	A : in std_logic;				--Entity declaration for AND Gate
			B : in std_logic;				--Input of the AND Gate
			C : out std_logic);			--Output of AND Gate
	end component;

	component XOR2 is 
		port( A : in std_logic;				--Entity declaration for XOR Gate
			B : in std_logic;				--Input of the XOR Gate
			C : out std_logic);			--Output of XOR Gate
	end component;
	
	component  XNOR1 is 
        port( A,B : in std_logic;
                f : out std_logic);
    end component;

	component HALF_ADDER is 				--Entity declaration for Half adder
		port ( A,B : in std_logic;			--Input of the Half adder	
		 	 s,c : out std_logic);			--Output of Half adder
	end component;
	
	component FULL_ADDER is 				--Entity declaration for Full adder
		port ( A,B,Cin : in std_logic;		--Input of the Full adder
		 	S,Cout : out std_logic);		--Output of Full adder
	end component;
	component MUX_2x1 is 					--Entity declaration for 2x1 Multiplexer
		port( A,B,S: in std_logic;			--INPUT of the 2x1 Multiplexer
			f : out std_logic);			--Output of the 2x1 Multiplexer
	end component;
	component DEMUX_1x2 is 					--Entity declaration for 2x1 DeMultiplexer
		port( A,S: in std_logic;			--INPUT of the 2x1 DeMultiplexer
			f1,f2 : out std_logic);			--Output of the 2x1 DeMultiplexer
	end component;
	component FOUR_BIT_ADDER is						--Entity Declaration
		port (A : in std_logic_vector(3 downto 0);		-- First Input 
			B : in std_logic_vector(3 downto 0);		--Second Input
			Cin : in std_logic;				--Carry into the first bit
			Sum : out std_logic_vector(4 downto 0));		--5 Bit Output
	end component;
	component FOUR_BIT_ADDER_1 is						--Entity Declaration
		port (A : in std_logic_vector(3 downto 0);		-- First Input 
			B : in std_logic_vector(3 downto 0);		--Second Input
			Cin : in std_logic;				--Carry into the first bit
			Sum : out std_logic_vector(4 downto 0));		--5 Bit Output
	end component;
	component FOUR_BIT_ADDER_2 is						--Entity Declaration
		port (A : in std_logic_vector(3 downto 0);		-- First Input 
			B : in std_logic_vector(3 downto 0);		--Second Input
			Cin : in std_logic;				--Carry into the first bit
			Sum : out std_logic_vector(4 downto 0));		--5 Bit Output
	end component;
	component D_FF is -- Entity declaration
	port( D : in std_logic; -- Data input of the D flipflop
		   CLK : in std_logic; -- Clock input of the D flipflop
		   CLRN : in std_logic; -- Active low clear input of the D flipflop
		   PREN : in std_logic; -- Active low preset input of the D flipflop
		   Q : buffer std_logic; -- Q output of the D flipflop
	      QN : out std_logic); -- Q_bar output of the D flipflop
	end component;

	COMPONENT CLK_DVD_1 is
	port(CLK_IN : in std_logic; 	-- Input clock
		  RSTN : in std_logic; 		-- Active low reset
		  CLK_OUT : out std_logic); 	-- Output clock
	end COMPONENT;
	COMPONENT BCD2SSD is 		-- Entity declaration
		port(X : in std_logic_vector(3 downto 0); -- Input BCD number
	  		Y : out std_logic_vector(6 downto 0); -- Output SSD code
	  		F : out std_logic); -- Invalid input indicator
	end COMPONENT;
	COMPONENT  COUNTER_SYNCR is 									-- Entity declaration
        port(CLK : in std_logic;                             -- Clock input of the counter
            RSTN : in std_logic;                             -- Active low reset input of the counter
            UP_DN : in std_logic;                             -- Count up if UP_DN is high, down if low
            LDN : in std_logic;                             -- Load D to the counter if LDN is low
             E : in std_logic;                             -- Count if E is high, retain otherwise
            D : in std_logic_vector(3 downto 0);                 -- Count to load when LDN is low
             Q : inout std_logic_vector(3 downto 0));                 -- Output state of the counter
    end COMPONENT;
	

	


end CS210;

		