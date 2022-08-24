--define signal "A" as type with initial value of 4
signal A : integer := 4;

-- Define signal B as type unsigned with inital value of 0000
signal B : unsigned (3 downto 0) := "0000";

--Define signal B1 as type unsigned with initial value of 0000
signal B1 : unisgned (3 downto 0) := (others => '0';

----------------------------------------------------------------
--Note: 
-- Siganl B and B1 are the same:
----------------------------------------------------------------
