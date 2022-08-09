-----------------------------------------------------------------
-- Company:
--
-- Engineer: Carlos Cruz
--
-- Module Name: BLINKY_LED
--
-- Description: Uses a conuter that will blink all LEDs ON/OFF at regular 
--				intervals. The blink rate is changable through the generic
--				of the design. There is an active low reset and turn the
--				LEDs off.
--
-- Revision: 1.0 - 8/9/2022
--
-- Comments: All the LEDs will turn on and off simultaneously. In order 
--			 to change this, the initial value set is the 'led_reg'
--			 register will need to be changed.
-----------------------------------------------------------------


--Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

--entity
entity BLINKY_LED is 
	Generic ( 
		NUM_LEDS	: integer := 4;			--8 LEDs default
		CLK_RATE	: integer := 100000000;	--50MHz default
		BLINK_RATE	: integer := 2);			--2 Hz default
	Port (
		Led_Out		: out std_logic_vector (NUM_LEDS - 1 downto 0);
		Clk 		: in std_logic;
		Reset		: in std_logic); 		--Active low
end BLINKY_LED;

--architecture
architecture behavior of BLINKY_LED is

--Calculate count valueto determine 'BLINK_RATE' from generic
constant MAX_VAL 	: integer := CLK_RATE / BLINK_RATE;						--The max value we need to calculate the blink rate

constant BIT_DEPTH	: integer := integer(ceil(log2(real(MAX_VAL))));		--How many bits are require to count to the maximum value

signal count_reg	: unsigned (BIT_DEPTH - 1 downto 0) := (others => '0');	--Used to hold the count value

signal led_reg		:std_logic_vector(NUM_LEDS - 1 downto 0) := "0000";		--It is going to hold the value that is going to be output on the LEDs




	begin
	
	--Assign output LED values
	Led_Out <= led_reg;
	
	
	-- Process that increments the count every rising clock edge
	count_proc: process(Clk)
	begin
		if rising_edge (Clk)then
			if ((reset = '0')or (count_reg = MAX_VAL)) then
				count_reg <= (others => '0');
			else
				count_reg <= count_reg + 1;
			end if;
		end if;
	end process count_proc;
	
	
	--Process that will toggle led output every time the counter 
	--reaches the calculated 'MAX_VAL'
	output_proc: process (Clk)
	begin
		if rising_edge (Clk) then
			if (count_reg = MAX_VAL) then
			led_reg <= NOT led_reg;
			
			end if;
		end if;
	end process output_proc;
end behavior;