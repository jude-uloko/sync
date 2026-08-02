-- Hybrid Memory Architecture
-- Sync Layer (The Brain)
-- Written by: Jude (ulokojude)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sync_layer is 
  port (
    clk : in std_logic;
    reset : in std_logic;
    dram_data : in std_logic_vector(7 downto 0);
    dram_write : in std_logic;
    nand_data : out std_logic_vector(7 downto 0);
    nand_write : out std_logic
  );
end sync_layer;

architecture Behavioral of sync_layer is
begin
  process(clk, reset)
  begin
    if reset = '1' then
      nand_data <= (others => '0');
      nand_write <= '0';
    
    else rising_edge(clk) then 
      if dram_write = '1' then
        -- Core invention
        -- Every DRAM write instantly to NAND
        nand_data <= dram_data;
        nand_write <= '1';
      else
        nand_write <= '0';
      end if;
    end if;
  end process;
end Behavioral; 