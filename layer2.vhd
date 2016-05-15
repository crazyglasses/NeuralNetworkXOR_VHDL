----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:05 04/16/2016 
-- Design Name: 
-- Module Name:    Layer_2 - Behavioral 
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
use WORK.FloatPt.all;
use WORK.mypackage.all;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Layer_2 is
PORT(	clk: IN STD_LOGIC;
		y1,y2,y3:IN array1 ;
		w11,w21,w31 :IN STD_LOGIC_VECTOR(31 downto 0);
		o:out array1	);
end Layer_2;

architecture Behavioral of Layer_2 is
signal out1,out2,out3:array1:=(others=> (others=>'0'));
signal a,b:STD_LOGIC;
signal t1,t2,t3:array1;   --FOR Y1 Y2 Y3
begin


-- Our output should be Output=Y1*W11+Y2*W22+Y3*W33

--FOR Y1*W11    (Let this quantity be X)
F0:FPP_MULT port map(t1(1),w11,clk,'0','1',a,b,out1(1));
F1:FPP_MULT port map(t1(2),w11,clk,'0','1',a,b,out1(2));
F2:FPP_MULT port map(t1(3),w11,clk,'0','1',a,b,out1(3));
F3:FPP_MULT port map(t1(4),w11,clk,'0','1',a,b,out1(4));

--FOR Y2*W21	  (Let this quantity be Y)	
F4:FPP_MULT port map(t2(1),w21,clk,'0','1',a,b,out2(1));
F5:FPP_MULT port map(t2(2),w21,clk,'0','1',a,b,out2(2));
F6:FPP_MULT port map(t2(3),w21,clk,'0','1',a,b,out2(3));
F7:FPP_MULT port map(t2(4),w21,clk,'0','1',a,b,out2(4));

--FOR Y3*W31     (Let this quantity be Z)
F8:FPP_MULT port map(t3(1),w31,clk,'0','1',a,b,out3(1));
F9:FPP_MULT port map(t3(2),w31,clk,'0','1',a,b,out3(2));
F10:FPP_MULT port map(t3(3),w31,clk,'0','1',a,b,out3(3));
F11:FPP_MULT port map(t3(4),w31,clk,'0','1',a,b,out3(4));

--Output=X+Y+Z

I1:FPP_ADD_SUB port map(out1(1),out2(1),clk,'0','1',a,out1(1));
I2:FPP_ADD_SUB port map(out1(2),out2(2),clk,'0','1',a,out1(2));
I3:FPP_ADD_SUB port map(out1(3),out2(3),clk,'0','1',a,out1(3));
I4:FPP_ADD_SUB port map(out1(4),out2(4),clk,'0','1',a,out1(4));

I5:FPP_ADD_SUB port map(out1(1),out3(1),clk,'0','1',a,out1(1));
I6:FPP_ADD_SUB port map(out1(2),out3(2),clk,'0','1',a,out1(2));
I7:FPP_ADD_SUB port map(out1(3),out3(3),clk,'0','1',a,out1(3));
I8:FPP_ADD_SUB port map(out1(4),out3(4),clk,'0','1',a,out1(4));


-- FINAL OUTPUT
o(1)<=out1(1);
o(2)<=out1(2);
o(3)<=out1(3);
o(4)<=out1(4);


end Behavioral;