----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:23 04/20/2016 
-- Design Name: 
-- Module Name:    l2delta - Behavioral 
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

entity l2delta is
PORT(	clk: IN STD_LOGIC;
		output:out array1 ;
		input,in_1:in array1	);

end l2delta;

architecture Behavioral of l2delta is
signal a,b:STD_LOGIC;
signal in1,in2,out1:array1;
begin

--UPDATING MSB OF INPUT TO NEGATIVE NUMBER
in1<= input;
in1(1)(31) <='1' ;
in1(2)(31) <='1' ;
in1(3)(31) <='1' ;
in1(4)(31) <='1' ;

--EVALUATING a=(1-x)

I1:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(1),clk,'0','1',a,out1(1));
I2:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(2),clk,'0','1',a,out1(2));
I3:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(3),clk,'0','1',a,out1(3));
I4:FPP_ADD_SUB port map("00111111100000000000000000000000",in1(4),clk,'0','1',a,out1(4));

-- x/(1-x)

in2<= input;
F0:FPP_DIVIDE port map(in2(1),out1(1),clk,'0','1',a,b,out1(1));
F1:FPP_DIVIDE port map(in2(2),out1(2),clk,'0','1',a,b,out1(2));
F2:FPP_DIVIDE port map(in2(3),out1(3),clk,'0','1',a,b,out1(3));
F3:FPP_DIVIDE port map(in2(4),out1(4),clk,'0','1',a,b,out1(4));

--L2_DELTA * OUTPUTG0:FPP_MULT port map(out1(1),in_1(1),clk,'0','1',a,b,out1(1));
G1:FPP_MULT port map(out1(2),in_1(2),clk,'0','1',a,b,out1(2));G2:FPP_MULT port map(out1(3),in_1(3),clk,'0','1',a,b,out1(3));
G3:FPP_MULT port map(out1(4),in_1(4),clk,'0','1',a,b,out1(4));--ASSIGNING OUTPUT
output(1)<=out1(1);
output(2)<=out1(2);
output(3)<=out1(3);
output(4)<=out1(4);

end Behavioral;