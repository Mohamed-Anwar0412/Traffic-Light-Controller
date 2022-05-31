
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity T_lights is
    Port ( SW_Vehicle_sensor : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
           Main_TL : out  STD_LOGIC_VECTOR (2 downto 0);
           Side_TL : out  STD_LOGIC_VECTOR (2 downto 0));
end T_lights;

architecture Behavioral of T_lights is
signal count : STD_LOGIC_VECTOR(4 downto 0);
constant sec30 : STD_LOGIC_VECTOR(4 downto 0):= "11110";
constant sec5 : STD_LOGIC_VECTOR(2 downto 0):= "101";
type Light_state is (mG_sR,mY_sR,mR_sG,mR_sY);
signal state: Light_state;
begin
process(reset,clk)
begin
	if(reset='0')then
		state <= mG_sR;
		count <= "00000";
	elsif(rising_edge(clk))then
			case state is
			when mG_sR =>
			Main_TL <= "001";
			Side_TL <= "100";
			if(SW_Vehicle_sensor = '1' and count >= sec30)then
				state <= mY_sR;
				count <= "00000";
			else
				state <= mG_sR;
				count <= count + 1;
			end if;
			when mY_sR =>
			Main_TL <= "010";
			Side_TL <= "100";
			if(count >= sec5)then
				state <= mR_sG;
				count <= "00000";
			else
				state <= mY_sR;
				count <= count + 1;
			end if;
			when mR_sG =>
			Main_TL <= "100";
			Side_TL <= "001";
			if(SW_Vehicle_sensor = '0' or count >= sec30)then
				state <= mR_sY;
				count <= "00000";
			else
				state <= mR_sG;
				count <= count + 1;
			end if;
			when mR_sY =>
			Main_TL <= "100";
			Side_TL <= "010";
			if(count >= sec5)then
				state <= mG_sR;
				count <= "00000";
			else
				state <= mR_sY;
				count <= count + 1;
			end if;
			when others => 
			state <= mG_sR;
			end case;
	end if;
end process;
end Behavioral;

