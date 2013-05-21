-------------------------------------------------------------------------------
-- system_chipscope_vio_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library chipscope_vio_0_v1_05_a;
use chipscope_vio_0_v1_05_a.all;

entity system_chipscope_vio_0_wrapper is
  port (
    chipscope_icon_control : in std_logic_vector(35 downto 0);
    async_in : in std_logic_vector(7 downto 0);
    async_out : out std_logic_vector(0 to 0);
    clk : in std_logic;
    sync_in : in std_logic_vector(8 downto 0);
    sync_out : out std_logic_vector(15 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_chipscope_vio_0_wrapper : entity is "chipscope_vio_v1_05_a";

end system_chipscope_vio_0_wrapper;

architecture STRUCTURE of system_chipscope_vio_0_wrapper is

  component chipscope_vio is
    generic (
      C_FAMILY : string;
      C_DEVICE : string;
      C_PACKAGE : string;
      C_SPEEDGRADE : string;
      C_ASYNC_INPUT_ENABLE : integer;
      C_ASYNC_INPUT_WIDTH : integer;
      C_ASYNC_OUTPUT_ENABLE : integer;
      C_ASYNC_OUTPUT_WIDTH : integer;
      C_SYNC_INPUT_ENABLE : integer;
      C_SYNC_INPUT_WIDTH : integer;
      C_SYNC_OUTPUT_ENABLE : integer;
      C_SYNC_OUTPUT_WIDTH : integer;
      C_RISING_CLOCK_EDGE : integer
    );
    port (
      chipscope_icon_control : in std_logic_vector(35 downto 0);
      async_in : in std_logic_vector(C_ASYNC_INPUT_WIDTH-1 downto 0);
      async_out : out std_logic_vector(C_ASYNC_OUTPUT_WIDTH-1 to 0);
      clk : in std_logic;
      sync_in : in std_logic_vector(C_SYNC_INPUT_WIDTH-1 downto 0);
      sync_out : out std_logic_vector(C_SYNC_OUTPUT_WIDTH-1 downto 0)
    );
  end component;

begin

  chipscope_vio_0 : chipscope_vio
    generic map (
      C_FAMILY => "zynq",
      C_DEVICE => "7z020",
      C_PACKAGE => "clg484",
      C_SPEEDGRADE => "-1",
      C_ASYNC_INPUT_ENABLE => 0,
      C_ASYNC_INPUT_WIDTH => 8,
      C_ASYNC_OUTPUT_ENABLE => 1,
      C_ASYNC_OUTPUT_WIDTH => 1,
      C_SYNC_INPUT_ENABLE => 1,
      C_SYNC_INPUT_WIDTH => 9,
      C_SYNC_OUTPUT_ENABLE => 1,
      C_SYNC_OUTPUT_WIDTH => 16,
      C_RISING_CLOCK_EDGE => 1
    )
    port map (
      chipscope_icon_control => chipscope_icon_control,
      async_in => async_in,
      async_out => async_out,
      clk => clk,
      sync_in => sync_in,
      sync_out => sync_out
    );

end architecture STRUCTURE;

