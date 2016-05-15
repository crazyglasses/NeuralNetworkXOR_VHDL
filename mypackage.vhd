--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mypackage is

 type array1 is array(1 to 4) of STD_LOGIC_VECTOR(31 downto 0);
end mypackage;
