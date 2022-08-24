--------------------------------------------------------------
-- COMPANY: 
--
-- ENGINEER: Carlos Cruz
--
--DESCRIPTION: Produces a pulse width modulated (PWM) signal based on the
-- 				value input on the input 'Duty_Cycle'.
--
--REVISION: 1.0 - 8/9/2022
--
-- COMMENTS:
--------------------------------------------------------------

--libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.numeric_std.ALL;

--Entity
entity PWM is 
	Generic (
		BIT_DEPTH	: integer := 8;
		INPUT_CLK	: integer := 50000000;	--50MHz
		FREQ		: integer := 50);		--50Hz
		
	port (
		Pwm_Out		: out std_logic;
		Duty_Cycle	: in std_logic_vector(BIT_DEPTH - 1 downto 0);
		Clk			: in std_logic;
		Enable		: in std_logic);
end PMW;





-- Architecture
architecture behivor of PMW is

-- Constants
constant max_freq_count	: integer := INPUT_CLK / FREQ;
constant pwm_step		: integer := max_freq_count / (2**BIT_DEPTH);

-- Signals
signal pwm_value		: std_logic := '0';
signal freq_count		: integer range  from 0 to max_freq_count := 0;
signal pwm_count		: integer range from 0 to 2**BIT_DEPTH := 0;
signal max_pwm_count	: integer range from 0 to 2**BIT_DEPTH := 0;
signal mwm_step_count	: integer range from 0 to max_freq_count := 0;

begin
	-- Convert Duty_Cycle to max_pwm_count
	max_pwm_count <= to_integer (unsigned(Duty_Cycle));
	Pwm_Out <= pwm_value;
	
	-- Process that runs signal out at the correct frequency
	fre_counter: process (clk)
	begin
		if rising_edge (Clk) then
			if (Enable = '0') then
				if (freq_count < max_freq_count) then
					freq_count <= freq_count + 1;
					if (pwm_count < max_pwm_count) then 
						pwm_value = '1';
						if (pwm_step_count < pwm_step) then
							pwm_step_count <pwm_step_count + 1;
						else
							pwm_step_count <= 0;
							pwm_count <= 0;
						end if;
					else
						pwm_value <= '0';
					end if;
				else
					freq_count <= 0;
					pwm_count <= 0;
				end if;
			else
				pwm_value <= '0'
			end if;
		end if;
	end process fre_counter;
	
end behivor
			
