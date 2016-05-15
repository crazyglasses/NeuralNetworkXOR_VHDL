----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:33 04/20/2016 
-- Design Name: 
-- Module Name:    l1_error - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.mypackage.all;
use WORK.FloatPt.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity l1_error is
	port(clk:IN STD_LOGIC;
		  o:IN array1; --l2 delta
		  w11,w21,w31 :IN STD_LOGIC_VECTOR(31 downto 0);
		  y1,y2,y3:OUT array1);
end l1_error;

architecture Behavioral of l1_error is
signal out1,out2,out3:array1:=(others=> (others=>'0')); -- For output array
signal a,b:STD_LOGIC; -- random signals 
signal t1,t2,t3:array1;  -- For addition
begin
--MULTIPLYING O with w11
F0:FPP_MULT port map(o(1),w11,clk,'0','1',a,b,y1(1));
F1:FPP_MULT port map(o(2),w11,clk,'0','1',a,b,y1(2));
F2:FPP_MULT port map(o(3),w11,clk,'0','1',a,b,y1(3));
F3:FPP_MULT port map(o(4),w11,clk,'0','1',a,b,y1(4));

--MULTIPLYING O with W21

G0:FPP_MULT port map(o(1),w21,clk,'0','1',a,b,y2(1));
G1:FPP_MULT port map(o(2),w21,clk,'0','1',a,b,y2(2));
G2:FPP_MULT port map(o(3),w21,clk,'0','1',a,b,y2(3));
G3:FPP_MULT port map(o(4),w21,clk,'0','1',a,b,y2(4));

--MULTIPLYING O with W31

H0:FPP_MULT port map(o(1),w31,clk,'0','1',a,b,y3(1));
H1:FPP_MULT port map(o(2),w31,clk,'0','1',a,b,y3(2));
H2:FPP_MULT port map(o(3),w31,clk,'0','1',a,b,y3(3));
H3:FPP_MULT port map(o(4),w31,clk,'0','1',a,b,y3(4));

end Behavioral;

