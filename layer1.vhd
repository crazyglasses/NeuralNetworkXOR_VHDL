----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:09 04/16/2016 
-- Design Name: 
-- Module Name:    layer1 - Behavioral 
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

entity layer1 is
PORT(	clk: IN STD_LOGIC;
		w11,w12,w13,w21,w22,w23 :IN STD_LOGIC_VECTOR(31 downto 0);
		y1,y2,y3:OUT array1 );
end layer1;

architecture Behavioral of layer1 is
signal o1,o2,o3:array1:=(others=> (others=>'0'));
signal temp1,temp2,temp3:array1;
signal x1:array1:=(1=>"00000000000000000000000000000000",2=>"00000000000000000000000000000000",3=>"00111111100000000000000000000000",4=>"00111111100000000000000000000000");
signal x2:array1:=(1=>"00000000000000000000000000000000",2=>"00111111100000000000000000000000",3=>"00000000000000000000000000000000",4=>"00111111100000000000000000000000");
signal a,b:STD_LOGIC;
begin
------------------------------------------------------
--X1 MULTIPLIED WITH WEIGHTS
------------------------------------------------------
F0:FPP_MULT port map(x1(1),w11,clk,'0','1',a,b,o1(1));
F1:FPP_MULT port map(x1(1),w12,clk,'0','1',a,b,o2(1));
F2:FPP_MULT port map(x1(1),w13,clk,'0','1',a,b,o3(1));

F4:FPP_MULT port map(x1(2),w11,clk,'0','1',a,b,o1(2));
F5:FPP_MULT port map(x1(2),w12,clk,'0','1',a,b,o2(2));
F6:FPP_MULT port map(x1(2),w13,clk,'0','1',a,b,o3(2));

F7:FPP_MULT port map(x1(3),w11,clk,'0','1',a,b,o1(3));
F8:FPP_MULT port map(x1(3),w12,clk,'0','1',a,b,o2(3));
F9:FPP_MULT port map(x1(3),w13,clk,'0','1',a,b,o3(3));

F10:FPP_MULT port map(x1(4),w11,clk,'0','1',a,b,o1(4));
F11:FPP_MULT port map(x1(4),w12,clk,'0','1',a,b,o2(4));
F12:FPP_MULT port map(x1(4),w13,clk,'0','1',a,b,o3(4));
---------------------------------------------------------
--X2 MULTIPIED WITH WEIGHTSS
--------------------------------------------------------
G0:FPP_MULT port map(x2(1),w11,clk,'0','1',a,b,temp1(1));
G1:FPP_MULT port map(x2(1),w12,clk,'0','1',a,b,temp2(1));
G2:FPP_MULT port map(x2(1),w13,clk,'0','1',a,b,temp3(1));

G4:FPP_MULT port map(x2(2),w11,clk,'0','1',a,b,temp1(2));
G5:FPP_MULT port map(x2(2),w12,clk,'0','1',a,b,temp2(2));
G6:FPP_MULT port map(x2(2),w13,clk,'0','1',a,b,temp3(2));

G7:FPP_MULT port map(x2(3),w11,clk,'0','1',a,b,temp1(3));
G8:FPP_MULT port map(x2(3),w12,clk,'0','1',a,b,temp2(3));
G9:FPP_MULT port map(x2(3),w13,clk,'0','1',a,b,temp3(3));

G10:FPP_MULT port map(x2(4),w11,clk,'0','1',a,b,temp1(4));
G11:FPP_MULT port map(x2(4),w12,clk,'0','1',a,b,temp2(4));
G12:FPP_MULT port map(x2(4),w13,clk,'0','1',a,b,temp3(4));

--------------------------------------------------------
--ADDING O'S AND TEMP'S (ACCUMILATION ACTION)
--------------------------------------------------------
--Output y1--
I1:FPP_ADD_SUB port map(o1(1),temp1(1),clk,'0','1',a,o1(1));
I2:FPP_ADD_SUB port map(o1(2),temp1(2),clk,'0','1',a,o1(2));
I3:FPP_ADD_SUB port map(o1(3),temp1(3),clk,'0','1',a,o1(3));
I4:FPP_ADD_SUB port map(o1(4),temp1(4),clk,'0','1',a,o1(4));

--Output y2--

I5:FPP_ADD_SUB port map(o2(1),temp2(1),clk,'0','1',a,o2(1));
I6:FPP_ADD_SUB port map(o2(2),temp2(2),clk,'0','1',a,o2(2));
I7:FPP_ADD_SUB port map(o2(3),temp2(3),clk,'0','1',a,o2(3));
I8:FPP_ADD_SUB port map(o2(4),temp2(4),clk,'0','1',a,o2(4));

--Output y3--

I9:FPP_ADD_SUB port map(o3(1),temp3(1),clk,'0','1',a,o3(1));
I10:FPP_ADD_SUB port map(o3(2),temp3(2),clk,'0','1',a,o3(2));
I11:FPP_ADD_SUB port map(o3(3),temp3(3),clk,'0','1',a,o3(3));
I12:FPP_ADD_SUB port map(o3(4),temp3(4),clk,'0','1',a,o3(4));
--Assigning output y1--
y1(1)<=o1(1);
y1(2)<=o1(2);
y1(3)<=o1(2);
y1(4)<=o1(3);
--Assigning output y2--
y2(1)<=o2(1);
y2(2)<=o2(2);
y2(3)<=o2(2);
y2(4)<=o2(3);				
--Assigning output y3--
y3(1)<=o3(1);
y3(2)<=o3(2);
y3(3)<=o3(2);
y3(4)<=o3(3);

end Behavioral;

