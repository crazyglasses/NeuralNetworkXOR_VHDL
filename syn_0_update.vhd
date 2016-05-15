----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:16 04/20/2016 
-- Design Name: 
-- Module Name:    syn_0_update - Behavioral 
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

entity syn_0_update is
Port(clk:IN STD_LOGIC;
	  i1,i2:IN array1;
	  o1,o2,o3:IN array1;
	  w11,w12,w13,w21,w22,w23: OUT STD_LOGIC_VECTOR(31 downto 0)
	  );
end syn_0_update;

architecture Behavioral of syn_0_update is
signal a,b: STD_LOGIC;
signal x:array1;
signal sum:STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
begin
--TO FIND THE WEIGHT W11
H0:FPP_MULT port map(i1(1),o1(1),clk,'0','1',a,b,x(1));
H1:FPP_MULT port map(i1(2),o1(2),clk,'0','1',a,b,x(2));
H2:FPP_MULT port map(i1(3),o1(3),clk,'0','1',a,b,x(3));
H3:FPP_MULT port map(i1(4),o1(4),clk,'0','1',a,b,x(4));

III1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
III2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
I3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
I4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w11<=sum;
--TO FIND THE WEIGHT W12
sum<=(others=>'0');
G0:FPP_MULT port map(i1(1),o2(1),clk,'0','1',a,b,x(1));
G1:FPP_MULT port map(i1(2),o2(2),clk,'0','1',a,b,x(2));
G2:FPP_MULT port map(i1(3),o2(3),clk,'0','1',a,b,x(3));
G3:FPP_MULT port map(i1(4),o2(4),clk,'0','1',a,b,x(4));

J1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
J2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
J3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
J4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w12<=sum;

--TO FIND THE WEIGHT W13
sum<=(others=>'0');
F0:FPP_MULT port map(i1(1),o3(1),clk,'0','1',a,b,x(1));
F1:FPP_MULT port map(i1(2),o3(2),clk,'0','1',a,b,x(2));
F2:FPP_MULT port map(i1(3),o3(3),clk,'0','1',a,b,x(3));
F3:FPP_MULT port map(i1(4),o3(4),clk,'0','1',a,b,x(4));

K1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
K2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
K3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
K4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w13<=sum;

--TO FIND THE WEIGHT W21
HH0:FPP_MULT port map(i2(1),o1(1),clk,'0','1',a,b,x(1));
HH1:FPP_MULT port map(i2(2),o1(2),clk,'0','1',a,b,x(2));
HH2:FPP_MULT port map(i2(3),o1(3),clk,'0','1',a,b,x(3));
HH3:FPP_MULT port map(i2(4),o1(4),clk,'0','1',a,b,x(4));

II1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
II2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
II3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
II4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w21<=sum;
--TO FIND THE WEIGHT W22
sum<=(others=>'0');
GG0:FPP_MULT port map(i2(1),o2(1),clk,'0','1',a,b,x(1));
GG1:FPP_MULT port map(i2(2),o2(2),clk,'0','1',a,b,x(2));
GG2:FPP_MULT port map(i2(3),o2(3),clk,'0','1',a,b,x(3));
GG3:FPP_MULT port map(i2(4),o2(4),clk,'0','1',a,b,x(4));

JJ1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
JJ2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
JJ3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
JJ4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w22<=sum;

--TO FIND THE WEIGHT W23
sum<=(others=>'0');
FF0:FPP_MULT port map(i2(1),o3(1),clk,'0','1',a,b,x(1));
FF1:FPP_MULT port map(i2(2),o3(2),clk,'0','1',a,b,x(2));
FF2:FPP_MULT port map(i2(3),o3(3),clk,'0','1',a,b,x(3));
FF3:FPP_MULT port map(i2(4),o3(4),clk,'0','1',a,b,x(4));

KK1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
KK2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
KK3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
KK4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

w23<=sum;

end Behavioral;

