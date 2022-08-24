
----------------------------------------------------
-- VHDL code for n-bit counter
-- Eduacation & undertanding
--
-- this is the behavior description of n-bit counter
-- another way can be used is FSM model. 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counter_1 is

	generic(
		n: integer :=2);
	port(	
		clock:	in std_logic;
		clear:	in std_logic;
		count:	in std_logic;
		Q:	out std_logic_vector(n-1 downto 0)
);
end counter_1;

----------------------------------------------------

architecture behv of counter_1 is		 	  
	
    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the counter

    process(clock, count, clear)
    begin
	if clear = '1' then
 	    Pre_Q <= Pre_Q - Pre_Q;
	elsif (clock='1' and clock'event) then
	    if count = '1' then
		Pre_Q <= Pre_Q + 1;
	    end if;
	end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;

end behv;

-----------------------------------------------------