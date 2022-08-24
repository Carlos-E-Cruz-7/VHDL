-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.Numeric_Std.all;

entity COUNTER_tb is
end;

architecture bench of COUNTER_tb is

  component counter 
  	generic (
  		MAX_VAL		: integer := 2**30;
  		SYNCH_Reset	: boolean := true);
  	Port (
  		Max_Count	: out std_logic;
  		Clk			: in std_logic;
  		Reset		: in std_logic);
  end component;
  
  constant MAX_VAL		: integer := 2**30;
  constant SYNCH_Reset	: boolean := true;
   
  signal Max_Count: std_logic;
  signal Clk: std_logic;
  signal Reset: std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: counter generic map ( MAX_VAL     => MAX_VAL,
                             SYNCH_Reset =>  SYNCH_Reset)
                  port map ( Max_Count   => Max_Count,
                             Clk         => Clk,
                             Reset       => Reset );

  stimulus: process
  begin
  
    -- Put initialisation code here
		wait for 20 ns;
		Reset <= '1';
		wait for 400 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;