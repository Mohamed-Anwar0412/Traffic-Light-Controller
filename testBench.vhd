--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:09 06/06/2021
-- Design Name:   
-- Module Name:   D:/vhdl/project/Traffic_Lights/testBench.vhd
-- Project Name:  Traffic_Lights
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: T_lights
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT T_lights
    PORT(
         SW_Vehicle_sensor : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         Main_TL : OUT  std_logic_vector(2 downto 0);
         Side_TL : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SW_Vehicle_sensor : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Main_TL : std_logic_vector(2 downto 0);
   signal Side_TL : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: T_lights PORT MAP (
          SW_Vehicle_sensor => SW_Vehicle_sensor,
          clk => clk,
          reset => reset,
          Main_TL => Main_TL,
          Side_TL => Side_TL
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
