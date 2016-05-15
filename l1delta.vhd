----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:51:51 04/20/2016 
-- Design Name: 
-- Module Name:    l1delta - Behavioral 
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

entity l1delta is
PORT(	clk: IN STD_LOGIC;
		output1,output2,output3:out array1 ;
		input1,input2,input3,i1,i2,i3:in array1	);

end l1delta;

architecture Behavioral of l1delta is
signal a,b:STD_LOGIC;
signal in1,in2,in3,in4,in5,in6,out1,out2,out3:array1;
begin

--UPDATING MSB OF INPUT TO NEGATIVE NUMBER
in1<= input1;
in2<= input2;
in3<= input3;


in1(1)(31) <='1' ;
in1(2)(31) <='1' ;
in1(3)(31) <='1' ;
in1(4)(31) <='1' ;

in2(1)(31) <='1' ;
in2(2)(31) <='1' ;
in2(3)(31) <='1' ;
in2(4)(31) <='1' ;

in3(1)(31) <='1' ;
in3(2)(31) <='1' ;
in3(3)(31) <='1' ;
in3(4)(31) <='1' ;

--EVALUATING a=(1-x)
K1:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(1),clk,'0','1',a,out1(1));
K2:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(2),clk,'0','1',a,out1(2));
K3:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(3),clk,'0','1',a,out1(3));
K4:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(4),clk,'0','1',a,out1(4));

K5:FPP_ADD_SUB port map("00111111100000000000000000000000",in2(1),clk,'0','1',a,out2(1));
K6:FPP_ADD_SUB port map("00111111100000000000000000000000",in2(2),clk,'0','1',a,out2(2));
K7:FPP_ADD_SUB port map("00111111100000000000000000000000",in2(3),clk,'0','1',a,out2(3));
K8:FPP_ADD_SUB port map("00111111100000000000000000000000",in2(4),clk,'0','1',a,out2(4));
K9:FPP_ADD_SUB port map("00111111100000000000000000000000",in3(1),clk,'0','1',a,out3(1));
K10:FPP_ADD_SUB port map("00111111100000000000000000000000",in3(2),clk,'0','1',a,out3(2));
K11:FPP_ADD_SUB port map("00111111100000000000000000000000",in3(3),clk,'0','1',a,out3(3));
K12:FPP_ADD_SUB port map("00111111100000000000000000000000",in3(4),clk,'0','1',a,out3(4));
-- x/(1-x)


in4<= input1;
in5<= input2;
in6<= input3;

F0:FPP_DIVIDE port map(in4(1),out1(1),clk,'0','1',a,b,out1(1));
F1:FPP_DIVIDE port map(in4(2),out1(2),clk,'0','1',a,b,out1(2));
F2:FPP_DIVIDE port map(in4(3),out1(3),clk,'0','1',a,b,out1(3));
F3:FPP_DIVIDE port map(in4(4),out1(4),clk,'0','1',a,b,out1(4));

F4:FPP_DIVIDE port map(in5(1),out2(1),clk,'0','1',a,b,out2(1));
F5:FPP_DIVIDE port map(in5(2),out2(2),clk,'0','1',a,b,out2(2));
F6:FPP_DIVIDE port map(in5(3),out2(3),clk,'0','1',a,b,out2(3));
F7:FPP_DIVIDE port map(in5(4),out2(4),clk,'0','1',a,b,out2(4));

F8:FPP_DIVIDE port map(in6(1),out3(1),clk,'0','1',a,b,out3(1));
F9:FPP_DIVIDE port map(in6(2),out3(2),clk,'0','1',a,b,out3(2));
F10:FPP_DIVIDE port map(in6(3),out3(3),clk,'0','1',a,b,out3(3));
F11:FPP_DIVIDE port map(in6(4),out3(4),clk,'0','1',a,b,out3(4));



--L1_DELTA * OUTPUTG0:FPP_MULT port map(out1(1),in1(1),clk,'0','1',a,b,out1(1));
G1:FPP_MULT port map(out1(2),in1(2),clk,'0','1',a,b,out1(2));
G2:FPP_MULT port map(out1(3),in1(3),clk,'0','1',a,b,out1(3));
G3:FPP_MULT port map(out1(4),in1(4),clk,'0','1',a,b,out1(4));
G4:FPP_MULT port map(out2(1),in2(1),clk,'0','1',a,b,out2(1));
G5:FPP_MULT port map(out2(2),in2(2),clk,'0','1',a,b,out2(2));
G6:FPP_MULT port map(out2(3),in2(3),clk,'0','1',a,b,out2(3));
G7:FPP_MULT port map(out2(4),in2(4),clk,'0','1',a,b,out2(4));

G8:FPP_MULT port map(out3(1),in3(1),clk,'0','1',a,b,out3(1));
G9:FPP_MULT port map(out3(2),in3(2),clk,'0','1',a,b,out3(2));
G10:FPP_MULT port map(out3(3),in3(3),clk,'0','1',a,b,out3(3));
G11:FPP_MULT port map(out3(4),in3(4),clk,'0','1',a,b,out3(4));

--ASSIGNING OUTPUT 1

output1(1)<=out1(1);
output1(2)<=out1(2);
output1(3)<=out1(3);
output1(4)<=out1(4);

--ASSIGNING OUTPUT 2

output2(1)<=out2(1);
output2(2)<=out2(2);
output2(3)<=out2(3);
output2(4)<=out2(4);

--ASSIGNING OUTPUT 3
output3(1)<=out3(1);
output3(2)<=out3(2);
output3(3)<=out3(3);
output3(4)<=out3(4);end Behavioral;
