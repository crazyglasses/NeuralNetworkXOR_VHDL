----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:33:53 04/17/2016 
-- Design Name: 
-- Module Name:    XOR - Behavioral 
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

entity train is
Port(clk:IN STD_LOGIC;
	  w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31: OUT array1);
end train;

architecture Behavioral of XOR is
component layer1 is
PORT(	clk: IN STD_LOGIC;
		w11,w12,w13,w21,w22,w23 :IN STD_LOGIC_VECTOR(31 downto 0);
		y1,y2,y3:OUT array1 );
end component;
component Layer_2 is
PORT(	clk: IN STD_LOGIC;
		y1,y2,y3:IN array1 ;
		w11,w21,w31 :IN STD_LOGIC_VECTOR(31 downto 0);
		o:out array1	);
end component;
signal y:array1:=("00000000000000000000000000000000","00111111100000000000000000000000","00111111100000000000000000000000","00000000000000000000000000000000");
signal w1_11s,w1_12s,w1_13s,w1_21s,w1_22s,w1_23s:array1;
signal w2_11s,w2_21s,w2_31s:array1;
begin
-- CALLING LAYER1
F1:layer1 port map(clk,
-- APPLY SIGMOID 

end Behavioral;

