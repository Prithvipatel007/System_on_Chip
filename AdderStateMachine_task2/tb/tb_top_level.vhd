LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------
ENTITY tb_top_level IS
END tb_top_level;

ARCHITECTURE arch of tb_top_level IS
	COMPONENT toplevel IS
		PORT(
			clk_12M	:	IN STD_LOGIC;
			rp_i	:	IN STD_LOGIC;
			led_o	:	OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT toplevel;
	
	SIGNAL clk_12M_s : STD_LOGIC;
	SIGNAL rp_s 	: STD_LOGIC;
	SIGNAL led_s 	: STD_LOGIC_VECTOR(7 DOWNTO 0);	
	
BEGIN
	
	dut : entity work.toplevel PORT MAP(clk_12M_s, rp_s, led_s);
	
	clocked : PROCESS
	BEGIN
		clk_12M_s <= '1';
		WAIT FOR 83.3333333 ns;
		clk_12M_s <= '0';
		WAIT FOR 83.3333333 ns;
	END PROCESS clocked;
	
	functioning : PROCESS
	BEGIN
		rp_s <= '1';
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		
		WAIT;
	END PROCESS functioning;

END arch;