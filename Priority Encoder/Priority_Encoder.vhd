library IEEE;
use IEEE.std_logic_1164.all;

entity Priority_Encoder_2 is	
	port (
		encode 		: out std_logic_vector(2 downto 0);
		a_in		:in std_logic_vector(7 downto 0));
end Priority_Encoder_2;

architecture behavior of Priority_Encoder_2 is 

begin
	
	enc_process process (a_in)
	begin
		if (a_in(7) = '1') then	
			encode <= "111";
		elsif (a_in(6) = '1') then
			encode <= "110";
		elsif (a_in(5) = '1') then
			encode <= "101";
		elsif (a_in(4) = '1') then
			encode <= "100";
		elsif (a_in(3) = '1') then
			encode <= "011";
		elsif (a_in(2) = '1') then
			encode <= "010";
		elsif (a_in(1) = '1') then
			encode <= "001";
		elsif (a_in(0) = '1') then
			encode <= "000";
		else 
			encode <= (others => 'X');
		end if;
		
	end process enc_process;