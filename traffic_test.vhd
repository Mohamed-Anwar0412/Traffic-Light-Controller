LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY traffic_test IS
END traffic_test;
 
ARCHITECTURE behavior OF traffic_test IS 
 
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
   constant clk_period : time := 1 ns;
 
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
		-- insert stimulus here 	
      reset <= '0';
		SW_Vehicle_sensor <= '0';
      wait for clk_period*10;
		reset <= '1';
		wait for clk_period*20;
		SW_Vehicle_sensor <= '1';
		wait for clk_period*100;
		SW_Vehicle_sensor <= '0';
     
      wait;
   end process;

END;
