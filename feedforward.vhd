----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:38 04/21/2016 
-- Design Name: 
-- Module Name:    feedforward - Behavioral 
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

entity feedforward is
port(x1,x2:IN STD_LOGIC_VECTOR(31 downto 0);
	  w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31:IN STD_LOGIC_VECTOR(31 downto 0);
	  clk:IN STD_LOGIC;
	  o:OUT STD_LOGIC_VECTOR(31 downto 0));
end feedforward;

architecture Behavioral of feedforward is
signal m1,m2,m3:STD_LOGIC_VECTOR(31 downto 0);
signal sum:STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
signal y:STD_LOGIC_VECTOR(31 downto 0);
signal a,b:STD_LOGIC;
begin
F0:FPP_MULT port map(x1,w1_11,clk,'0','1',a,b,sum);
F1:FPP_MULT port map(x2,w1_21,clk,'0','1',a,b,m1);
K12:FPP_ADD_SUB port map(m1,sum,clk,'0','1',a,m1);
sum<=(others=>'0');

G0:FPP_MULT port map(x1,w1_12,clk,'0','1',a,b,sum);
G1:FPP_MULT port map(x2,w1_22,clk,'0','1',a,b,m2);
L12:FPP_ADD_SUB port map(m1,sum,clk,'0','1',a,m2);
sum<=(others=>'0');

H0:FPP_MULT port map(x1,w1_13,clk,'0','1',a,b,sum);
H1:FPP_MULT port map(x2,w1_23,clk,'0','1',a,b,m3);
M12:FPP_ADD_SUB port map(m1,sum,clk,'0','1',a,m3);
sum<=(others=>'0');

I0:FPP_MULT port map(m1,w2_11,clk,'0','1',a,b,sum);
II1:FPP_MULT port map(m2,w2_21,clk,'0','1',a,b,y);
N12:FPP_ADD_SUB port map(y,sum,clk,'0','1',a,y);
I1:FPP_MULT port map(m3,w2_31,clk,'0','1',a,b,sum);
N123:FPP_ADD_SUB port map(y,sum,clk,'0','1',a,y);
sum<=(others=>'0');

o<=y;

end Behavioral;

