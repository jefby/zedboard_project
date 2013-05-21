-------------------------------------------------------------------------------
-- system_axi_bram_ctrl_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_bram_ctrl_v1_03_a;
use axi_bram_ctrl_v1_03_a.all;

entity system_axi_bram_ctrl_0_wrapper is
  port (
    ECC_Interrupt : out std_logic;
    ECC_UE : out std_logic;
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWID : in std_logic_vector(11 downto 0);
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWLEN : in std_logic_vector(7 downto 0);
    S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
    S_AXI_AWBURST : in std_logic_vector(1 downto 0);
    S_AXI_AWLOCK : in std_logic;
    S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
    S_AXI_AWPROT : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_AWREADY : out std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WLAST : in std_logic;
    S_AXI_WVALID : in std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BID : out std_logic_vector(11 downto 0);
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARID : in std_logic_vector(11 downto 0);
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARLEN : in std_logic_vector(7 downto 0);
    S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
    S_AXI_ARBURST : in std_logic_vector(1 downto 0);
    S_AXI_ARLOCK : in std_logic;
    S_AXI_ARCACHE : in std_logic_vector(3 downto 0);
    S_AXI_ARPROT : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RID : out std_logic_vector(11 downto 0);
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in std_logic;
    S_AXI_RLAST : out std_logic;
    S_AXI_CTRL_AWVALID : in std_logic;
    S_AXI_CTRL_AWREADY : out std_logic;
    S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_CTRL_WVALID : in std_logic;
    S_AXI_CTRL_WREADY : out std_logic;
    S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_CTRL_BVALID : out std_logic;
    S_AXI_CTRL_BREADY : in std_logic;
    S_AXI_CTRL_ARVALID : in std_logic;
    S_AXI_CTRL_ARREADY : out std_logic;
    S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_CTRL_RVALID : out std_logic;
    S_AXI_CTRL_RREADY : in std_logic;
    S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
    BRAM_Rst_A : out std_logic;
    BRAM_Clk_A : out std_logic;
    BRAM_En_A : out std_logic;
    BRAM_WE_A : out std_logic_vector(3 downto 0);
    BRAM_Addr_A : out std_logic_vector(31 downto 0);
    BRAM_WrData_A : out std_logic_vector(31 downto 0);
    BRAM_RdData_A : in std_logic_vector(31 downto 0);
    BRAM_Rst_B : out std_logic;
    BRAM_Clk_B : out std_logic;
    BRAM_En_B : out std_logic;
    BRAM_WE_B : out std_logic_vector(3 downto 0);
    BRAM_Addr_B : out std_logic_vector(31 downto 0);
    BRAM_WrData_B : out std_logic_vector(31 downto 0);
    BRAM_RdData_B : in std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_axi_bram_ctrl_0_wrapper : entity is "axi_bram_ctrl_v1_03_a";

end system_axi_bram_ctrl_0_wrapper;

architecture STRUCTURE of system_axi_bram_ctrl_0_wrapper is

  component axi_bram_ctrl is
    generic (
      C_S_AXI_PROTOCOL : STRING;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ID_WIDTH : INTEGER;
      C_S_AXI_SUPPORTS_NARROW_BURST : INTEGER;
      C_SINGLE_PORT_BRAM : INTEGER;
      C_S_AXI_CTRL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CTRL_DATA_WIDTH : INTEGER;
      C_ECC : INTEGER;
      C_FAULT_INJECT : INTEGER;
      C_ECC_ONOFF_RESET_VALUE : INTEGER
    );
    port (
      ECC_Interrupt : out std_logic;
      ECC_UE : out std_logic;
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWID : in std_logic_vector((C_S_AXI_ID_WIDTH - 1)  downto  0);
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWLEN : in std_logic_vector(7  downto  0);
      S_AXI_AWSIZE : in std_logic_vector(2  downto  0);
      S_AXI_AWBURST : in std_logic_vector(1  downto  0);
      S_AXI_AWLOCK : in std_logic;
      S_AXI_AWCACHE : in std_logic_vector(3  downto  0);
      S_AXI_AWPROT : in std_logic_vector(2  downto  0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH - 1)  downto  0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH / 8) - 1)  downto  0);
      S_AXI_WLAST : in std_logic;
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BID : out std_logic_vector((C_S_AXI_ID_WIDTH - 1)  downto  0);
      S_AXI_BRESP : out std_logic_vector(1  downto  0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARID : in std_logic_vector((C_S_AXI_ID_WIDTH - 1)  downto  0);
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH - 1)  downto  0);
      S_AXI_ARLEN : in std_logic_vector(7  downto  0);
      S_AXI_ARSIZE : in std_logic_vector(2  downto  0);
      S_AXI_ARBURST : in std_logic_vector(1  downto  0);
      S_AXI_ARLOCK : in std_logic;
      S_AXI_ARCACHE : in std_logic_vector(3  downto  0);
      S_AXI_ARPROT : in std_logic_vector(2  downto  0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RID : out std_logic_vector((C_S_AXI_ID_WIDTH - 1)  downto  0);
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH - 1)  downto  0);
      S_AXI_RRESP : out std_logic_vector(1  downto  0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_RLAST : out std_logic;
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(C_S_AXI_CTRL_ADDR_WIDTH-1 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(C_S_AXI_CTRL_DATA_WIDTH-1 downto 0);
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(C_S_AXI_CTRL_ADDR_WIDTH-1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(C_S_AXI_CTRL_DATA_WIDTH-1 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_En_A : out std_logic;
      BRAM_WE_A : out std_logic_vector((C_S_AXI_DATA_WIDTH/8 + C_ECC*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0);
      BRAM_Addr_A : out std_logic_vector((C_S_AXI_ADDR_WIDTH - 1)  downto  0);
      BRAM_WrData_A : out std_logic_vector((C_S_AXI_DATA_WIDTH + C_ECC*8*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0);
      BRAM_RdData_A : in std_logic_vector((C_S_AXI_DATA_WIDTH + C_ECC*8*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0);
      BRAM_Rst_B : out std_logic;
      BRAM_Clk_B : out std_logic;
      BRAM_En_B : out std_logic;
      BRAM_WE_B : out std_logic_vector((C_S_AXI_DATA_WIDTH/8 + C_ECC*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0);
      BRAM_Addr_B : out std_logic_vector((C_S_AXI_ADDR_WIDTH - 1)  downto  0);
      BRAM_WrData_B : out std_logic_vector((C_S_AXI_DATA_WIDTH + C_ECC*8*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0);
      BRAM_RdData_B : in std_logic_vector((C_S_AXI_DATA_WIDTH + C_ECC*8*(1+(C_S_AXI_DATA_WIDTH/128)) - 1)  downto  0)
    );
  end component;

begin

  axi_bram_ctrl_0 : axi_bram_ctrl
    generic map (
      C_S_AXI_PROTOCOL => "AXI4",
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ID_WIDTH => 12,
      C_S_AXI_SUPPORTS_NARROW_BURST => 0,
      C_SINGLE_PORT_BRAM => 0,
      C_S_AXI_CTRL_ADDR_WIDTH => 32,
      C_S_AXI_CTRL_DATA_WIDTH => 32,
      C_ECC => 0,
      C_FAULT_INJECT => 0,
      C_ECC_ONOFF_RESET_VALUE => 1
    )
    port map (
      ECC_Interrupt => ECC_Interrupt,
      ECC_UE => ECC_UE,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWID => S_AXI_AWID,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWLEN => S_AXI_AWLEN,
      S_AXI_AWSIZE => S_AXI_AWSIZE,
      S_AXI_AWBURST => S_AXI_AWBURST,
      S_AXI_AWLOCK => S_AXI_AWLOCK,
      S_AXI_AWCACHE => S_AXI_AWCACHE,
      S_AXI_AWPROT => S_AXI_AWPROT,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WLAST => S_AXI_WLAST,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BID => S_AXI_BID,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARID => S_AXI_ARID,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARLEN => S_AXI_ARLEN,
      S_AXI_ARSIZE => S_AXI_ARSIZE,
      S_AXI_ARBURST => S_AXI_ARBURST,
      S_AXI_ARLOCK => S_AXI_ARLOCK,
      S_AXI_ARCACHE => S_AXI_ARCACHE,
      S_AXI_ARPROT => S_AXI_ARPROT,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RID => S_AXI_RID,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RLAST => S_AXI_RLAST,
      S_AXI_CTRL_AWVALID => S_AXI_CTRL_AWVALID,
      S_AXI_CTRL_AWREADY => S_AXI_CTRL_AWREADY,
      S_AXI_CTRL_AWADDR => S_AXI_CTRL_AWADDR,
      S_AXI_CTRL_WVALID => S_AXI_CTRL_WVALID,
      S_AXI_CTRL_WREADY => S_AXI_CTRL_WREADY,
      S_AXI_CTRL_WDATA => S_AXI_CTRL_WDATA,
      S_AXI_CTRL_BRESP => S_AXI_CTRL_BRESP,
      S_AXI_CTRL_BVALID => S_AXI_CTRL_BVALID,
      S_AXI_CTRL_BREADY => S_AXI_CTRL_BREADY,
      S_AXI_CTRL_ARVALID => S_AXI_CTRL_ARVALID,
      S_AXI_CTRL_ARREADY => S_AXI_CTRL_ARREADY,
      S_AXI_CTRL_ARADDR => S_AXI_CTRL_ARADDR,
      S_AXI_CTRL_RVALID => S_AXI_CTRL_RVALID,
      S_AXI_CTRL_RREADY => S_AXI_CTRL_RREADY,
      S_AXI_CTRL_RDATA => S_AXI_CTRL_RDATA,
      S_AXI_CTRL_RRESP => S_AXI_CTRL_RRESP,
      BRAM_Rst_A => BRAM_Rst_A,
      BRAM_Clk_A => BRAM_Clk_A,
      BRAM_En_A => BRAM_En_A,
      BRAM_WE_A => BRAM_WE_A,
      BRAM_Addr_A => BRAM_Addr_A,
      BRAM_WrData_A => BRAM_WrData_A,
      BRAM_RdData_A => BRAM_RdData_A,
      BRAM_Rst_B => BRAM_Rst_B,
      BRAM_Clk_B => BRAM_Clk_B,
      BRAM_En_B => BRAM_En_B,
      BRAM_WE_B => BRAM_WE_B,
      BRAM_Addr_B => BRAM_Addr_B,
      BRAM_WrData_B => BRAM_WrData_B,
      BRAM_RdData_B => BRAM_RdData_B
    );

end architecture STRUCTURE;

