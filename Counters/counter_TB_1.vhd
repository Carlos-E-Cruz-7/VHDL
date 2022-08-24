-----------------------------------------------------------------------
-- VHDL code for n-bit counter
-- Eduacation & undertanding
-- Test Bench for counter 
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;			 
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity counter_TB_1 is			-- entity declaration
end counter_TB_1;

-----------------------------------------------------------------------

architecture TB of counter_TB_1 is

    component counter_1
	generic(
			n: integer :=2);
    port(   clock:	in std_logic;
			clear:	in std_logic;
			count:	in std_logic;
			Q:		out std_logic_vector(n-1 downto 0)
    );
    end component;
	
	constant n: integer :=2;
	
    signal clock:     std_logic;
    signal clear:     std_logic;
    signal count:     std_logic;
    signal Q:         std_logic_vector(n-1 downto 0);

begin
    
    uut: counter_1	generic map 	( n		 => n)
							port map (clock	 => clock,
										clear	 => clear,
										count	 => count,
										Q		 => Q);
	
    
	
	--clock process 
	process				 
    begin
	clock <= '0';			-- clock cycle is 10 ns
	wait for 5 ns;
	clock <= '1';
	wait for 5 ns;
    end process;
	
	--stimulus procezs 
    stimulus: process
    begin								
			
		clear <= '1';			-- start counting
		count <= '1';
		wait for 20 ns;	
		
		clear <= '0';			-- clear output
			
		wait;
		
    end process;

end TB;

