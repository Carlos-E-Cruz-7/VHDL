----------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 8/4/2022
-- Design Name
-- Module Name: Button_Led - Behavioral
-- Project Name: 
-- Target Devices: Basys 3
-- Tool Version
-- Description
-- 
--
-- Dependencies:
--
--Revision:
--Revision 0.01 - File Created
-- Additional Coments
-----------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using 
-- arithmetic function with signed or unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncoment the following library declaration if instatiating 
-- any Xinlinx leaf cells in this code.
--library UNISIN;
--use UNISIN.VComponents.all;

entity Button_Led is 
	Generic (
		NUM_BUTTONS : integer := 4);
	Port (
		Led_Out		: out std_logic_vector(NUM_BUTTONS - 1 downto 0);
		Button_In	: in std_logic_vector(NUM_BUTTONS - 1 downto 0);
		Enable		: in std_logic);
end Button_Led;

architecture Behavioral of Button_Led is 

begin
	--Set the output of the LED's
	Led_Out <= Button_In when Enable = '0' else (others => '0');
	
end Behavioral;
