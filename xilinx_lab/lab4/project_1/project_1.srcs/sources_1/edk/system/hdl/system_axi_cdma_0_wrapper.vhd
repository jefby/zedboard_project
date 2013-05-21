-------------------------------------------------------------------------------
-- system_axi_cdma_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_cdma_v3_04_a;
use axi_cdma_v3_04_a.all;

entity system_axi_cdma_0_wrapper is
  port (
    m_axi_aclk : in std_logic;
    s_axi_lite_aclk : in std_logic;
    s_axi_lite_aresetn : in std_logic;
    cdma_introut : out std_logic;
    s_axi_lite_awvalid : in std_logic;
    s_axi_lite_awready : out std_logic;
    s_axi_lite_awaddr : in std_logic_vector(5 downto 0);
    s_axi_lite_wvalid : in std_logic;
    s_axi_lite_wready : out std_logic;
    s_axi_lite_wdata : in std_logic_vector(31 downto 0);
    s_axi_lite_bresp : out std_logic_vector(1 downto 0);
    s_axi_lite_bvalid : out std_logic;
    s_axi_lite_bready : in std_logic;
    s_axi_lite_arvalid : in std_logic;
    s_axi_lite_arready : out std_logic;
    s_axi_lite_araddr : in std_logic_vector(5 downto 0);
    s_axi_lite_rvalid : out std_logic;
    s_axi_lite_rready : in std_logic;
    s_axi_lite_rdata : out std_logic_vector(31 downto 0);
    s_axi_lite_rresp : out std_logic_vector(1 downto 0);
    m_axi_araddr : out std_logic_vector(31 downto 0);
    m_axi_arlen : out std_logic_vector(7 downto 0);
    m_axi_arsize : out std_logic_vector(2 downto 0);
    m_axi_arburst : out std_logic_vector(1 downto 0);
    m_axi_arprot : out std_logic_vector(2 downto 0);
    m_axi_arcache : out std_logic_vector(3 downto 0);
    m_axi_arvalid : out std_logic;
    m_axi_arready : in std_logic;
    m_axi_rdata : in std_logic_vector(31 downto 0);
    m_axi_rresp : in std_logic_vector(1 downto 0);
    m_axi_rlast : in std_logic;
    m_axi_rvalid : in std_logic;
    m_axi_rready : out std_logic;
    m_axi_awaddr : out std_logic_vector(31 downto 0);
    m_axi_awlen : out std_logic_vector(7 downto 0);
    m_axi_awsize : out std_logic_vector(2 downto 0);
    m_axi_awburst : out std_logic_vector(1 downto 0);
    m_axi_awprot : out std_logic_vector(2 downto 0);
    m_axi_awcache : out std_logic_vector(3 downto 0);
    m_axi_awvalid : out std_logic;
    m_axi_awready : in std_logic;
    m_axi_wdata : out std_logic_vector(31 downto 0);
    m_axi_wstrb : out std_logic_vector(3 downto 0);
    m_axi_wlast : out std_logic;
    m_axi_wvalid : out std_logic;
    m_axi_wready : in std_logic;
    m_axi_bresp : in std_logic_vector(1 downto 0);
    m_axi_bvalid : in std_logic;
    m_axi_bready : out std_logic;
    m_axi_sg_awaddr : out std_logic_vector(31 downto 0);
    m_axi_sg_awlen : out std_logic_vector(7 downto 0);
    m_axi_sg_awsize : out std_logic_vector(2 downto 0);
    m_axi_sg_awburst : out std_logic_vector(1 downto 0);
    m_axi_sg_awprot : out std_logic_vector(2 downto 0);
    m_axi_sg_awcache : out std_logic_vector(3 downto 0);
    m_axi_sg_awvalid : out std_logic;
    m_axi_sg_awready : in std_logic;
    m_axi_sg_wdata : out std_logic_vector(31 downto 0);
    m_axi_sg_wstrb : out std_logic_vector(3 downto 0);
    m_axi_sg_wlast : out std_logic;
    m_axi_sg_wvalid : out std_logic;
    m_axi_sg_wready : in std_logic;
    m_axi_sg_bresp : in std_logic_vector(1 downto 0);
    m_axi_sg_bvalid : in std_logic;
    m_axi_sg_bready : out std_logic;
    m_axi_sg_araddr : out std_logic_vector(31 downto 0);
    m_axi_sg_arlen : out std_logic_vector(7 downto 0);
    m_axi_sg_arsize : out std_logic_vector(2 downto 0);
    m_axi_sg_arburst : out std_logic_vector(1 downto 0);
    m_axi_sg_arprot : out std_logic_vector(2 downto 0);
    m_axi_sg_arcache : out std_logic_vector(3 downto 0);
    m_axi_sg_arvalid : out std_logic;
    m_axi_sg_arready : in std_logic;
    m_axi_sg_rdata : in std_logic_vector(31 downto 0);
    m_axi_sg_rresp : in std_logic_vector(1 downto 0);
    m_axi_sg_rlast : in std_logic;
    m_axi_sg_rvalid : in std_logic;
    m_axi_sg_rready : out std_logic;
    cdma_tvect_out : out std_logic_vector(31 downto 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_axi_cdma_0_wrapper : entity is "axi_cdma_v3_04_a";

end system_axi_cdma_0_wrapper;

architecture STRUCTURE of system_axi_cdma_0_wrapper is

  component axi_cdma is
    generic (
      C_S_AXI_LITE_ADDR_WIDTH : INTEGER;
      C_S_AXI_LITE_DATA_WIDTH : INTEGER;
      C_AXI_LITE_IS_ASYNC : INTEGER;
      C_M_AXI_ADDR_WIDTH : INTEGER;
      C_M_AXI_DATA_WIDTH : INTEGER;
      C_M_AXI_MAX_BURST_LEN : INTEGER;
      C_INCLUDE_DRE : INTEGER;
      C_USE_DATAMOVER_LITE : INTEGER;
      C_READ_ADDR_PIPE_DEPTH : INTEGER;
      C_WRITE_ADDR_PIPE_DEPTH : INTEGER;
      C_INCLUDE_SF : INTEGER;
      C_INCLUDE_SG : INTEGER;
      C_M_AXI_SG_ADDR_WIDTH : INTEGER;
      C_M_AXI_SG_DATA_WIDTH : INTEGER;
      C_DLYTMR_RESOLUTION : INTEGER;
      C_FAMILY : STRING;
      C_INSTANCE : STRING
    );
    port (
      m_axi_aclk : in std_logic;
      s_axi_lite_aclk : in std_logic;
      s_axi_lite_aresetn : in std_logic;
      cdma_introut : out std_logic;
      s_axi_lite_awvalid : in std_logic;
      s_axi_lite_awready : out std_logic;
      s_axi_lite_awaddr : in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
      s_axi_lite_wvalid : in std_logic;
      s_axi_lite_wready : out std_logic;
      s_axi_lite_wdata : in std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
      s_axi_lite_bresp : out std_logic_vector(1 downto 0);
      s_axi_lite_bvalid : out std_logic;
      s_axi_lite_bready : in std_logic;
      s_axi_lite_arvalid : in std_logic;
      s_axi_lite_arready : out std_logic;
      s_axi_lite_araddr : in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
      s_axi_lite_rvalid : out std_logic;
      s_axi_lite_rready : in std_logic;
      s_axi_lite_rdata : out std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
      s_axi_lite_rresp : out std_logic_vector(1 downto 0);
      m_axi_araddr : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
      m_axi_arlen : out std_logic_vector(7 downto 0);
      m_axi_arsize : out std_logic_vector(2 downto 0);
      m_axi_arburst : out std_logic_vector(1 downto 0);
      m_axi_arprot : out std_logic_vector(2 downto 0);
      m_axi_arcache : out std_logic_vector(3 downto 0);
      m_axi_arvalid : out std_logic;
      m_axi_arready : in std_logic;
      m_axi_rdata : in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
      m_axi_rresp : in std_logic_vector(1 downto 0);
      m_axi_rlast : in std_logic;
      m_axi_rvalid : in std_logic;
      m_axi_rready : out std_logic;
      m_axi_awaddr : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
      m_axi_awlen : out std_logic_vector(7 downto 0);
      m_axi_awsize : out std_logic_vector(2 downto 0);
      m_axi_awburst : out std_logic_vector(1 downto 0);
      m_axi_awprot : out std_logic_vector(2 downto 0);
      m_axi_awcache : out std_logic_vector(3 downto 0);
      m_axi_awvalid : out std_logic;
      m_axi_awready : in std_logic;
      m_axi_wdata : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
      m_axi_wstrb : out std_logic_vector((C_M_AXI_DATA_WIDTH/8)-1 downto 0);
      m_axi_wlast : out std_logic;
      m_axi_wvalid : out std_logic;
      m_axi_wready : in std_logic;
      m_axi_bresp : in std_logic_vector(1 downto 0);
      m_axi_bvalid : in std_logic;
      m_axi_bready : out std_logic;
      m_axi_sg_awaddr : out std_logic_vector(C_M_AXI_SG_ADDR_WIDTH-1 downto 0);
      m_axi_sg_awlen : out std_logic_vector(7 downto 0);
      m_axi_sg_awsize : out std_logic_vector(2 downto 0);
      m_axi_sg_awburst : out std_logic_vector(1 downto 0);
      m_axi_sg_awprot : out std_logic_vector(2 downto 0);
      m_axi_sg_awcache : out std_logic_vector(3 downto 0);
      m_axi_sg_awvalid : out std_logic;
      m_axi_sg_awready : in std_logic;
      m_axi_sg_wdata : out std_logic_vector(C_M_AXI_SG_DATA_WIDTH-1 downto 0);
      m_axi_sg_wstrb : out std_logic_vector((C_M_AXI_SG_DATA_WIDTH/8)-1 downto 0);
      m_axi_sg_wlast : out std_logic;
      m_axi_sg_wvalid : out std_logic;
      m_axi_sg_wready : in std_logic;
      m_axi_sg_bresp : in std_logic_vector(1 downto 0);
      m_axi_sg_bvalid : in std_logic;
      m_axi_sg_bready : out std_logic;
      m_axi_sg_araddr : out std_logic_vector(C_M_AXI_SG_ADDR_WIDTH-1 downto 0);
      m_axi_sg_arlen : out std_logic_vector(7 downto 0);
      m_axi_sg_arsize : out std_logic_vector(2 downto 0);
      m_axi_sg_arburst : out std_logic_vector(1 downto 0);
      m_axi_sg_arprot : out std_logic_vector(2 downto 0);
      m_axi_sg_arcache : out std_logic_vector(3 downto 0);
      m_axi_sg_arvalid : out std_logic;
      m_axi_sg_arready : in std_logic;
      m_axi_sg_rdata : in std_logic_vector(C_M_AXI_SG_DATA_WIDTH-1 downto 0);
      m_axi_sg_rresp : in std_logic_vector(1 downto 0);
      m_axi_sg_rlast : in std_logic;
      m_axi_sg_rvalid : in std_logic;
      m_axi_sg_rready : out std_logic;
      cdma_tvect_out : out std_logic_vector(31 downto 0)
    );
  end component;

begin

  axi_cdma_0 : axi_cdma
    generic map (
      C_S_AXI_LITE_ADDR_WIDTH => 6,
      C_S_AXI_LITE_DATA_WIDTH => 32,
      C_AXI_LITE_IS_ASYNC => 0,
      C_M_AXI_ADDR_WIDTH => 32,
      C_M_AXI_DATA_WIDTH => 32,
      C_M_AXI_MAX_BURST_LEN => 16,
      C_INCLUDE_DRE => 0,
      C_USE_DATAMOVER_LITE => 0,
      C_READ_ADDR_PIPE_DEPTH => 4,
      C_WRITE_ADDR_PIPE_DEPTH => 4,
      C_INCLUDE_SF => 1,
      C_INCLUDE_SG => 0,
      C_M_AXI_SG_ADDR_WIDTH => 32,
      C_M_AXI_SG_DATA_WIDTH => 32,
      C_DLYTMR_RESOLUTION => 125,
      C_FAMILY => "zynq",
      C_INSTANCE => "axi_cdma_0"
    )
    port map (
      m_axi_aclk => m_axi_aclk,
      s_axi_lite_aclk => s_axi_lite_aclk,
      s_axi_lite_aresetn => s_axi_lite_aresetn,
      cdma_introut => cdma_introut,
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_awready => s_axi_lite_awready,
      s_axi_lite_awaddr => s_axi_lite_awaddr,
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      s_axi_lite_wready => s_axi_lite_wready,
      s_axi_lite_wdata => s_axi_lite_wdata,
      s_axi_lite_bresp => s_axi_lite_bresp,
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_araddr => s_axi_lite_araddr,
      s_axi_lite_rvalid => s_axi_lite_rvalid,
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_rdata => s_axi_lite_rdata,
      s_axi_lite_rresp => s_axi_lite_rresp,
      m_axi_araddr => m_axi_araddr,
      m_axi_arlen => m_axi_arlen,
      m_axi_arsize => m_axi_arsize,
      m_axi_arburst => m_axi_arburst,
      m_axi_arprot => m_axi_arprot,
      m_axi_arcache => m_axi_arcache,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_arready => m_axi_arready,
      m_axi_rdata => m_axi_rdata,
      m_axi_rresp => m_axi_rresp,
      m_axi_rlast => m_axi_rlast,
      m_axi_rvalid => m_axi_rvalid,
      m_axi_rready => m_axi_rready,
      m_axi_awaddr => m_axi_awaddr,
      m_axi_awlen => m_axi_awlen,
      m_axi_awsize => m_axi_awsize,
      m_axi_awburst => m_axi_awburst,
      m_axi_awprot => m_axi_awprot,
      m_axi_awcache => m_axi_awcache,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_awready => m_axi_awready,
      m_axi_wdata => m_axi_wdata,
      m_axi_wstrb => m_axi_wstrb,
      m_axi_wlast => m_axi_wlast,
      m_axi_wvalid => m_axi_wvalid,
      m_axi_wready => m_axi_wready,
      m_axi_bresp => m_axi_bresp,
      m_axi_bvalid => m_axi_bvalid,
      m_axi_bready => m_axi_bready,
      m_axi_sg_awaddr => m_axi_sg_awaddr,
      m_axi_sg_awlen => m_axi_sg_awlen,
      m_axi_sg_awsize => m_axi_sg_awsize,
      m_axi_sg_awburst => m_axi_sg_awburst,
      m_axi_sg_awprot => m_axi_sg_awprot,
      m_axi_sg_awcache => m_axi_sg_awcache,
      m_axi_sg_awvalid => m_axi_sg_awvalid,
      m_axi_sg_awready => m_axi_sg_awready,
      m_axi_sg_wdata => m_axi_sg_wdata,
      m_axi_sg_wstrb => m_axi_sg_wstrb,
      m_axi_sg_wlast => m_axi_sg_wlast,
      m_axi_sg_wvalid => m_axi_sg_wvalid,
      m_axi_sg_wready => m_axi_sg_wready,
      m_axi_sg_bresp => m_axi_sg_bresp,
      m_axi_sg_bvalid => m_axi_sg_bvalid,
      m_axi_sg_bready => m_axi_sg_bready,
      m_axi_sg_araddr => m_axi_sg_araddr,
      m_axi_sg_arlen => m_axi_sg_arlen,
      m_axi_sg_arsize => m_axi_sg_arsize,
      m_axi_sg_arburst => m_axi_sg_arburst,
      m_axi_sg_arprot => m_axi_sg_arprot,
      m_axi_sg_arcache => m_axi_sg_arcache,
      m_axi_sg_arvalid => m_axi_sg_arvalid,
      m_axi_sg_arready => m_axi_sg_arready,
      m_axi_sg_rdata => m_axi_sg_rdata,
      m_axi_sg_rresp => m_axi_sg_rresp,
      m_axi_sg_rlast => m_axi_sg_rlast,
      m_axi_sg_rvalid => m_axi_sg_rvalid,
      m_axi_sg_rready => m_axi_sg_rready,
      cdma_tvect_out => cdma_tvect_out
    );

end architecture STRUCTURE;

