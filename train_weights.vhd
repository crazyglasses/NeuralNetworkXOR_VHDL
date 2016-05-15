----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:21:19 04/21/2016 
-- Design Name: 
-- Module Name:    train_weights - Behavioral 
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

entity train_weights is
Port(clk:IN STD_LOGIC;
	w11s,w12s,w13s,w21s,w22s,w23s,w12k,w11k,w21k,w31k:out std_logic_vector(31 downto 0));
end train_weights;
architecture Behavioral of train_weights is

component layer1 is
PORT(	clk: IN STD_LOGIC;
		w11,w12,w13,w21,w22,w23 :IN STD_LOGIC_VECTOR(31 downto 0);
		y1,y2,y3:OUT array1 );
end component;

component Layer_2 is
PORT(	clk1: IN STD_LOGIC;
		y1,y2,y3:IN array1 ;
		w11,w21,w31 :IN STD_LOGIC_VECTOR(31 downto 0);
		o:out array1	);
end component;
component l2delta is
PORT(	clk: IN STD_LOGIC;
		output:out array1 ;
		input,in_1:in array1	);
end component;
component l1_error is
	port(clk:IN STD_LOGIC;
		  o:IN array1;
		  w11,w21,w31 :IN STD_LOGIC_VECTOR(31 downto 0);
		  y1,y2,y3:OUT array1);
end component;
component l1delta is
PORT(	clk: IN STD_LOGIC;
		output1,output2,output3:out array1 ;
		input1,input2,input3,i1,i2,i3:in array1	);

end component;
component syn_0_update is
Port(clk:IN STD_LOGIC;
	  i1,i2:IN array1;
	  o1,o2,o3:IN array1;
	  w11,w12,w13,w21,w22,w23: OUT STD_LOGIC_VECTOR(31 downto 0)
	  );
end component;
component syn_1_update is
Port(clk:IN STD_LOGIC;
		y : IN array1; --L2_delta
		m1,m2,m3: IN array1; -- Intermediate layer (l1)
		o1,o2,o3: OUT STD_LOGIC_VECTOR(31 downto 0) --WEIGHTS w11,w21,w31
		);
end component;

signal w1_11,w1_12,w1_13,w1_21,w1_22,w1_23:STD_LOGIC_VECTOR(31 downto 0);
signal w2_11,w2_21,w2_31:STD_LOGIC_VECTOR(31 downto 0);

signal w1_11m,w1_12m,w1_13m,w1_21m,w1_22m,w1_23m:STD_LOGIC_VECTOR(31 downto 0);
signal w2_11m,w2_21m,w2_31m:STD_LOGIC_VECTOR(31 downto 0);

signal m1,m2,m3:array1;
signal o:array1;
signal a:STD_LOGIC;
signal y:array1:=(1=>"00000000000000000000000000000000",2=>"00111111100000000000000000000000",3=>"00111111100000000000000000000000",4=>"00000000000000000000000000000000");
signal l2_error:array1;
signal l2_delta:array1;
signal m_1,m_2,m_3:array1; -- Output for l1 error
signal o_1,o_2,o_3:array1;-- Output synapses for l1delta
signal x1:array1:=(1=>"00000000000000000000000000000000",2=>"00000000000000000000000000000000",3=>"00111111100000000000000000000000",4=>"00111111100000000000000000000000");
signal x2:array1:=(1=>"00000000000000000000000000000000",2=>"00111111100000000000000000000000",3=>"00000000000000000000000000000000",4=>"00111111100000000000000000000000");

begin
gen: for i in 0 to 60000 GENERATE
--RUNNING LAYER 1 CODE
F0: layer1 port map(clk,w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,m1,m2,m3);
--RUNNING NON LIN FUNCITON
--RUNNING LAYER 2 CODE
F1: Layer_2 port map(clk,m1,m2,m3,w2_11,w2_21,w2_31,o);
--RUNNING NON LIN FUNCTION

--TAKING THE DIFFERENCE OF ACTUAL OUTPUT AND RECEIVED OUTPUT
o(1)(31)<='1';
o(2)(31)<='1';
o(3)(31)<='1';
o(4)(31)<='1';
F2:FPP_ADD_SUB port map(o(1),y(1),clk,'0','1',a,l2_error(1));
F3:FPP_ADD_SUB port map(o(2),y(2),clk,'0','1',a,l2_error(2));
F4:FPP_ADD_SUB port map(o(3),y(3),clk,'0','1',a,l2_error(3));
F5:FPP_ADD_SUB port map(o(4),y(4),clk,'0','1',a,l2_error(4));
--CALCULATING L2_DELTA

F6:l2delta PORT MAP(clk,l2_delta,o,l2_error);
-- CALCULATING l1 error

F7:l1_error port map(clk,l2_delta,w2_11,w2_21,w2_31,m_1,m_2,m_3);
--CALCULATING l1 DeltaF8:l1delta port map(clk,o_1,o_2,o_3,m1,m2,m3,m_1,m_2,m_3);
--Calling synapse 
F9:syn_1_update PORT MAP(clk,l2_delta,m1,m2,m3,w2_11m,w2_21m,w2_31m);
F10:syn_0_update PORT MAP(clk,x1,x2,o_1,o_2,o_3,w1_11m,w1_12m,w1_13m,w1_21m,w1_22m,w1_23m);
--UPDATING SYN0 AND SYN1

G1:FPP_ADD_SUB port map(w2_11m,w2_11,clk,'0','1',a,w2_11);
G2:FPP_ADD_SUB port map(w2_21m,w2_21,clk,'0','1',a,w2_21);G3:FPP_ADD_SUB port map(w2_31m,w2_31,clk,'0','1',a,w2_31);

G4:FPP_ADD_SUB PORT MAP(w1_11,w1_11m,clk,'0','1',a,w1_11);G5:FPP_ADD_SUB PORT MAP(w1_12,w1_12m,clk,'0','1',a,w1_12);G6:FPP_ADD_SUB PORT MAP(w1_13,w1_13m,clk,'0','1',a,w1_13);G7:FPP_ADD_SUB PORT MAP(w1_21,w1_21m,clk,'0','1',a,w1_21);G8:FPP_ADD_SUB PORT MAP(w1_22,w1_22m,clk,'0','1',a,w1_22);G9:FPP_ADD_SUB PORT MAP(w1_23,w1_23m,clk,'0','1',a,w1_23);

end generate gen;--Assigning outputw11s<=w1_11;
w12s<=w1_12;
w13s<=w1_13;
w21s<=w1_21;
w22s<=w1_22;
w23s<=w1_23;

w11k<=w2_11;
w21k<=w2_21;
w31k<=w2_31;end Behavioral;

