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

library IEEE;
use IEEE.Std_logic_1164.all;


entity counter_2_tb is
end;

architecture behavioral of counter_2_tb is

  component counter_2
  	generic(
		Max_count : integer := 2);
		
  	port(	
  		clock	:	in std_logic;
  		clear	:	in std_logic;
  		Q		:	out std_logic_vector(Max_count downto 0));
  end component;
  
  constant Max_count : integer := 2;
  
  signal clock: std_logic;
  signal clear: std_logic;
  signal Q: std_logic_vector(Max_count downto 0);
  

begin

  -- Insert values for generic parameters !!
  uut: counter_2 generic map ( Max_count     => Max_count )
                    port map ( clock => clock,
                               clear => clear,
                               Q     => Q );

  --clock process definition
  clock_proc : process
	begin
		clock <= '0';
		wait for 5 ns;
		clock <= '1';
		wait for 5 ns;
	
  end process;
  
  
  --stimulus process 
  stimulus: process
	begin
		clear <= '1';
		wait for 30 ns;
		clear <= '0';
		wait;
    
	end process;


end behavioral;