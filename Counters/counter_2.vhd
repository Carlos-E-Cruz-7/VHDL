--------------------------------------------------------------
-- COMPANY: 
--
-- ENGINEER: Carlos Cruz
--
--DESCRIPTION: 3-bit counter (up counting)
--
--REVISION: 1.0 - 8/11/2022
--
-- COMMENTS:
--------------------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counter_2 is

	generic(
		Max_count: integer := 3);
	port(	

		clock	:	in std_logic;
		clear	:	in std_logic;
		Q		:	out std_logic_vector(Max_count downto 0));
	
end counter_2;

----------------------------------------------------

architecture behv of counter_2 is		 	  
	
    signal Pre_Q: std_logic_vector(Max_count  downto 0);

begin

    -- behavior describe the counter

    process(clock)
    begin
	if (rising_edge (clock)) then
		if (clear = '1') then
			Pre_Q <= (others => '0');
		else 
		Pre_Q <= Pre_Q + '1';
	    end if;
	end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;

end behv;

-----------------------------------------------------