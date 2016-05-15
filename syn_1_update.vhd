----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:41:23 04/20/2016 
-- Design Name: 
-- Module Name:    syn_1_update - Behavioral 
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

entity syn_1_update is
Port(clk:IN STD_LOGIC;
		y : IN array1; --L2_delta
		m1,m2,m3: IN array1; -- Intermediate layer (l1)
		o1,o2,o3: OUT STD_LOGIC_VECTOR(31 downto 0) --WEIGHTS w11,w21,w31
		);
end syn_1_update;

architecture Behavioral of syn_1_update is
signal a,b:STD_LOGIC;
signal x:array1;
signal sum:std_logic_vector(31 downto 0):=(others=>'0');
begin
-- TO FIND WEIGHT W11
F0:FPP_MULT port map(m1(1),y(1),clk,'0','1',a,b,x(1));
F1:FPP_MULT port map(m1(2),y(2),clk,'0','1',a,b,x(2));
F2:FPP_MULT port map(m1(3),y(3),clk,'0','1',a,b,x(3));
F3:FPP_MULT port map(m1(4),y(4),clk,'0','1',a,b,x(4));

I1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
I2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
I3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
I4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

o1<=sum;

--TO FIND WEIGHT W21
sum<=(others=>'0');
G0:FPP_MULT port map(m2(1),y(1),clk,'0','1',a,b,x(1));
G1:FPP_MULT port map(m2(2),y(2),clk,'0','1',a,b,x(2));
G2:FPP_MULT port map(m2(3),y(3),clk,'0','1',a,b,x(3));
G3:FPP_MULT port map(m2(4),y(4),clk,'0','1',a,b,x(4));

J1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
J2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
J3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
J4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

o2<=sum;

--TO FIND WEIGHT W31
sum<=(others=>'0');
H0:FPP_MULT port map(m1(1),y(1),clk,'0','1',a,b,x(1));
H1:FPP_MULT port map(m1(2),y(2),clk,'0','1',a,b,x(2));
H2:FPP_MULT port map(m1(3),y(3),clk,'0','1',a,b,x(3));
H3:FPP_MULT port map(m1(4),y(4),clk,'0','1',a,b,x(4));

K1:FPP_ADD_SUB port map(sum,x(1),clk,'0','1',a,sum);
K2:FPP_ADD_SUB port map(sum,x(2),clk,'0','1',a,sum);
K3:FPP_ADD_SUB port map(sum,x(3),clk,'0','1',a,sum);
K4:FPP_ADD_SUB port map(sum,x(4),clk,'0','1',a,sum);

o3<=sum;

end Behavioral;

