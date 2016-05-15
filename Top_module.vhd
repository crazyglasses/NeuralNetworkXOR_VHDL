----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:11 04/21/2016 
-- Design Name: 
-- Module Name:    Top_module - Behavioral 
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

entity Top_module is

port (clk :in std_logic ;
		x1,x2:IN STD_LOGIC_VECTOR(31 downto 0);
		output:OUT STD_LOGIC_VECTOR(31 downto 0));
end Top_module;

architecture Behavioral of Top_module is
component feedforward is
port(x1,x2:IN STD_LOGIC_VECTOR(31 downto 0);
	  w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31:IN STD_LOGIC_VECTOR(31 downto 0);
	  clk:IN STD_LOGIC;
	  o:OUT STD_LOGIC_VECTOR(31 downto 0));
end component;

component train_weights is
Port(clk:IN STD_LOGIC;
	w11s,w12s,w13s,w21s,w22s,w23s,w12k,w11k,w21k,w31k:out std_logic_vector(31 downto 0));
end component;
signal w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31:STD_LOGIC_VECTOR(31 downto 0);
signal o:STD_LOGIC_VECTOR(31 downto 0);
begin

F0: train_weights port map(clk,w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31);
F1: feedforward port map(x1,x2,w1_11,w1_12,w1_13,w1_21,w1_22,w1_23,w2_11,w2_21,w2_31,clk,o);
output<=o;

end Behavioral;

