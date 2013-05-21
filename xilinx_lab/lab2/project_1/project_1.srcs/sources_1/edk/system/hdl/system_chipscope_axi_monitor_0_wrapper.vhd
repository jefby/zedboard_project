-------------------------------------------------------------------------------
-- system_chipscope_axi_monitor_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library chipscope_axi_monitor_0_v3_05_a;
use chipscope_axi_monitor_0_v3_05_a.all;

entity system_chipscope_axi_monitor_0_wrapper is
  port (
    CHIPSCOPE_ICON_CONTROL : in std_logic_vector(35 downto 0);
    RESET : in std_logic;
    MON_AXI_TRIG_OUT : out std_logic;
    MON_AXI_TRIG_IN : in std_logic_vector(0 to 0);
    MON_AXI_ACLK : in std_logic;
    MON_AXI_ARESETN : in std_logic;
    MON_AXI_AWID : in std_logic_vector(0 to 0);
    MON_AXI_AWADDR : in std_logic_vector(31 downto 0);
    MON_AXI_AWLEN : in std_logic_vector(7 downto 0);
    MON_AXI_AWSIZE : in std_logic_vector(2 downto 0);
    MON_AXI_AWBURST : in std_logic_vector(1 downto 0);
    MON_AXI_AWLOCK : in std_logic_vector(0 to 0);
    MON_AXI_AWCACHE : in std_logic_vector(3 downto 0);
    MON_AXI_AWPROT : in std_logic_vector(2 downto 0);
    MON_AXI_AWQOS : in std_logic_vector(3 downto 0);
    MON_AXI_AWREGION : in std_logic_vector(3 downto 0);
    MON_AXI_AWUSER : in std_logic_vector(0 to 0);
    MON_AXI_AWVALID : in std_logic;
    MON_AXI_AWREADY : in std_logic;
    MON_AXI_WID : in std_logic_vector(0 to 0);
    MON_AXI_WDATA : in std_logic_vector(31 downto 0);
    MON_AXI_WSTRB : in std_logic_vector(3 downto 0);
    MON_AXI_WLAST : in std_logic;
    MON_AXI_WUSER : in std_logic_vector(0 to 0);
    MON_AXI_WVALID : in std_logic;
    MON_AXI_WREADY : in std_logic;
    MON_AXI_BID : in std_logic_vector(0 to 0);
    MON_AXI_BRESP : in std_logic_vector(1 downto 0);
    MON_AXI_BUSER : in std_logic_vector(0 to 0);
    MON_AXI_BVALID : in std_logic;
    MON_AXI_BREADY : in std_logic;
    MON_AXI_ARID : in std_logic_vector(0 to 0);
    MON_AXI_ARADDR : in std_logic_vector(31 downto 0);
    MON_AXI_ARLEN : in std_logic_vector(7 downto 0);
    MON_AXI_ARSIZE : in std_logic_vector(2 downto 0);
    MON_AXI_ARBURST : in std_logic_vector(1 downto 0);
    MON_AXI_ARLOCK : in std_logic_vector(0 to 0);
    MON_AXI_ARCACHE : in std_logic_vector(3 downto 0);
    MON_AXI_ARPROT : in std_logic_vector(2 downto 0);
    MON_AXI_ARQOS : in std_logic_vector(3 downto 0);
    MON_AXI_ARREGION : in std_logic_vector(3 downto 0);
    MON_AXI_ARUSER : in std_logic_vector(0 to 0);
    MON_AXI_ARVALID : in std_logic;
    MON_AXI_ARREADY : in std_logic;
    MON_AXI_RID : in std_logic_vector(0 to 0);
    MON_AXI_RDATA : in std_logic_vector(31 downto 0);
    MON_AXI_RRESP : in std_logic_vector(1 downto 0);
    MON_AXI_RLAST : in std_logic;
    MON_AXI_RUSER : in std_logic_vector(0 to 0);
    MON_AXI_RVALID : in std_logic;
    MON_AXI_RREADY : in std_logic;
    MON_AXI_S_TVALID : in std_logic;
    MON_AXI_S_TREADY : in std_logic;
    MON_AXI_S_TDATA : in std_logic_vector(31 downto 0);
    MON_AXI_S_TKEEP : in std_logic_vector(3 downto 0);
    MON_AXI_S_TLAST : in std_logic;
    MON_AXI_S_TID : in std_logic_vector(0 to 0);
    MON_AXI_S_TDEST : in std_logic_vector(0 to 0);
    MON_AXI_S_TUSER : in std_logic_vector(0 to 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_chipscope_axi_monitor_0_wrapper : entity is "chipscope_axi_monitor_v3_05_a";

end system_chipscope_axi_monitor_0_wrapper;

architecture STRUCTURE of system_chipscope_axi_monitor_0_wrapper is

  component chipscope_axi_monitor is
    generic (
      C_MON_AXI_PROTOCOL : string;
      C_MON_AXI_S_PROTOCOL : string;
      C_USE_INTERFACE : string;
      C_MON_AXI_PC_NUM_OF_MATCH : integer;
      C_MON_AXI_EN_HANDSHAKE_CHECKS : integer;
      C_MON_AXI_EN_COMPLEX_CHECKS : integer;
      C_MON_AXI_EN_EXCLUSIVE_CHECKS : integer;
      C_MON_AXI_EN_IGNORE_CHECKS : integer;
      C_MON_AXI_EN_ILLEGAL_VALUE_CHECKS : integer;
      C_MON_AXI_EN_RESET_CHECKS : integer;
      C_MON_AXI_EN_AUX_CHECKS : integer;
      C_MON_AXI_EN_ARM_REC_WAIT_CHECKS : integer;
      C_MON_AXI_EN_ARM_REC_ONLY_CHECKS : integer;
      C_MON_AXI_PC_ERROR_COUNT : integer;
      C_MON_AXI_PC_MAXRBURST : integer;
      C_MON_AXI_PC_MAXWBURST : integer;
      C_MON_AXI_PC_EXMON_WIDTH : integer;
      C_MON_AXI_BURST_LENGTH : integer;
      C_MON_AXI_LOCK_LENGTH : integer;
      C_FAMILY : string;
      C_DEVICE : string;
      C_PACKAGE : string;
      C_SPEEDGRADE : string;
      C_NUM_DATA_SAMPLES : integer;
      C_MAX_SEQUENCER_LEVELS : integer;
      C_USE_TRIG_IN : integer;
      C_TRIG_IN_WIDTH : integer;
      C_MON_AXI_SUPPORTS_THREADS : integer;
      C_MON_AXI_ID_WIDTH : integer;
      C_MON_AXI_S_TID_WIDTH : integer;
      C_MON_AXI_ADDR_WIDTH : integer;
      C_MON_AXI_S_TDEST_WIDTH : integer;
      C_MON_AXI_DATA_WIDTH : integer;
      C_MON_AXI_S_TDATA_WIDTH : integer;
      C_MON_AXI_AWUSER_WIDTH : integer;
      C_MON_AXI_WUSER_WIDTH : integer;
      C_MON_AXI_BUSER_WIDTH : integer;
      C_MON_AXI_ARUSER_WIDTH : integer;
      C_MON_AXI_RUSER_WIDTH : integer;
      C_MON_AXI_S_TUSER_WIDTH : integer;
      C_MON_AXI_SUPPORTS_READ : integer;
      C_MON_AXI_SUPPORTS_WRITE : integer;
      C_MON_AXI_GLOBAL_MATCH_TYPE : string;
      C_MON_AXI_AWADDRCONTROL_MATCH_TYPE : string;
      C_MON_AXI_AWADDR_MATCH_TYPE : string;
      C_MON_AXI_WDATACONTROL_MATCH_TYPE : string;
      C_MON_AXI_WDATA_MATCH_TYPE : string;
      C_MON_AXI_BRESP_MATCH_TYPE : string;
      C_MON_AXI_ARADDRCONTROL_MATCH_TYPE : string;
      C_MON_AXI_ARADDR_MATCH_TYPE : string;
      C_MON_AXI_RDATACONTROL_MATCH_TYPE : string;
      C_MON_AXI_RDATA_MATCH_TYPE : string;
      C_MON_AXI_AWUSER_MATCH_TYPE : string;
      C_MON_AXI_WUSER_MATCH_TYPE : string;
      C_MON_AXI_BUSER_MATCH_TYPE : string;
      C_MON_AXI_ARUSER_MATCH_TYPE : string;
      C_MON_AXI_RUSER_MATCH_TYPE : string;
      C_MON_AXI_S_TCONTROL_MATCH_TYPE : string;
      C_MON_AXI_S_TDATA_MATCH_TYPE : string;
      C_MON_AXI_S_TUSER_MATCH_TYPE : string;
      C_MON_AXI_PC_MATCH_TYPE : string;
      C_MON_AXI_GLOBAL_NUM_OF_MATCH : integer;
      C_MON_AXI_AWADDRCONTROL_NUM_OF_MATCH : integer;
      C_MON_AXI_AWADDR_NUM_OF_MATCH : integer;
      C_MON_AXI_WDATACONTROL_NUM_OF_MATCH : integer;
      C_MON_AXI_WDATA_NUM_OF_MATCH : integer;
      C_MON_AXI_BRESP_NUM_OF_MATCH : integer;
      C_MON_AXI_ARADDRCONTROL_NUM_OF_MATCH : integer;
      C_MON_AXI_ARADDR_NUM_OF_MATCH : integer;
      C_MON_AXI_RDATACONTROL_NUM_OF_MATCH : integer;
      C_MON_AXI_RDATA_NUM_OF_MATCH : integer;
      C_MON_AXI_AWUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_WUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_BUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_ARUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_RUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_S_TCONTROL_NUM_OF_MATCH : integer;
      C_MON_AXI_S_TDATA_NUM_OF_MATCH : integer;
      C_MON_AXI_S_TUSER_NUM_OF_MATCH : integer;
      C_MON_AXI_GLOBAL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_AWADDRCONTROL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_AWADDR_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_WDATACONTROL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_WDATA_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_BRESP_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_ARADDRCONTROL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_ARADDR_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_RDATACONTROL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_RDATA_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_AWUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_WUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_BUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_ARUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_RUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_S_TCONTROL_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_S_TDATA_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_S_TUSER_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_PC_TRIG_COUNT_WIDTH : integer;
      C_MON_AXI_GLOBAL_TRACE : string;
      C_MON_AXI_AWADDRCONTROL_TRACE : string;
      C_MON_AXI_AWADDR_TRACE : string;
      C_MON_AXI_WDATACONTROL_TRACE : string;
      C_MON_AXI_WDATA_TRACE : string;
      C_MON_AXI_BRESP_TRACE : string;
      C_MON_AXI_ARADDRCONTROL_TRACE : string;
      C_MON_AXI_ARADDR_TRACE : string;
      C_MON_AXI_RDATACONTROL_TRACE : string;
      C_MON_AXI_RDATA_TRACE : string;
      C_MON_AXI_AWUSER_TRACE : string;
      C_MON_AXI_WUSER_TRACE : string;
      C_MON_AXI_BUSER_TRACE : string;
      C_MON_AXI_ARUSER_TRACE : string;
      C_MON_AXI_RUSER_TRACE : string;
      C_MON_AXI_S_TCONTROL_TRACE : string;
      C_MON_AXI_S_TDATA_TRACE : string;
      C_MON_AXI_S_TUSER_TRACE : string;
      C_MON_AXI_PC_TRACE : string
    );
    port (
      CHIPSCOPE_ICON_CONTROL : in std_logic_vector(35 downto 0);
      RESET : in std_logic;
      MON_AXI_TRIG_OUT : out std_logic;
      MON_AXI_TRIG_IN : in std_logic_vector(((C_TRIG_IN_WIDTH)-1) to 0);
      MON_AXI_ACLK : in std_logic;
      MON_AXI_ARESETN : in std_logic;
      MON_AXI_AWID : in std_logic_vector(((C_MON_AXI_ID_WIDTH)-1) to 0);
      MON_AXI_AWADDR : in std_logic_vector(((C_MON_AXI_ADDR_WIDTH)-1) downto 0);
      MON_AXI_AWLEN : in std_logic_vector(((C_MON_AXI_BURST_LENGTH)-1) downto 0);
      MON_AXI_AWSIZE : in std_logic_vector(2 downto 0);
      MON_AXI_AWBURST : in std_logic_vector(1 downto 0);
      MON_AXI_AWLOCK : in std_logic_vector(((C_MON_AXI_LOCK_LENGTH)-1) to 0);
      MON_AXI_AWCACHE : in std_logic_vector(3 downto 0);
      MON_AXI_AWPROT : in std_logic_vector(2 downto 0);
      MON_AXI_AWQOS : in std_logic_vector(3 downto 0);
      MON_AXI_AWREGION : in std_logic_vector(3 downto 0);
      MON_AXI_AWUSER : in std_logic_vector((C_MON_AXI_AWUSER_WIDTH-1) to 0);
      MON_AXI_AWVALID : in std_logic;
      MON_AXI_AWREADY : in std_logic;
      MON_AXI_WID : in std_logic_vector(((C_MON_AXI_ID_WIDTH)-1) to 0);
      MON_AXI_WDATA : in std_logic_vector(((C_MON_AXI_DATA_WIDTH)-1) downto 0);
      MON_AXI_WSTRB : in std_logic_vector((((C_MON_AXI_DATA_WIDTH)/8)-1) downto 0);
      MON_AXI_WLAST : in std_logic;
      MON_AXI_WUSER : in std_logic_vector((C_MON_AXI_WUSER_WIDTH-1) to 0);
      MON_AXI_WVALID : in std_logic;
      MON_AXI_WREADY : in std_logic;
      MON_AXI_BID : in std_logic_vector(((C_MON_AXI_ID_WIDTH)-1) to 0);
      MON_AXI_BRESP : in std_logic_vector(1 downto 0);
      MON_AXI_BUSER : in std_logic_vector(((C_MON_AXI_BUSER_WIDTH)-1) to 0);
      MON_AXI_BVALID : in std_logic;
      MON_AXI_BREADY : in std_logic;
      MON_AXI_ARID : in std_logic_vector(((C_MON_AXI_ID_WIDTH)-1) to 0);
      MON_AXI_ARADDR : in std_logic_vector(((C_MON_AXI_ADDR_WIDTH)-1) downto 0);
      MON_AXI_ARLEN : in std_logic_vector(((C_MON_AXI_BURST_LENGTH)-1) downto 0);
      MON_AXI_ARSIZE : in std_logic_vector(2 downto 0);
      MON_AXI_ARBURST : in std_logic_vector(1 downto 0);
      MON_AXI_ARLOCK : in std_logic_vector(((C_MON_AXI_LOCK_LENGTH)-1) to 0);
      MON_AXI_ARCACHE : in std_logic_vector(3 downto 0);
      MON_AXI_ARPROT : in std_logic_vector(2 downto 0);
      MON_AXI_ARQOS : in std_logic_vector(3 downto 0);
      MON_AXI_ARREGION : in std_logic_vector(3 downto 0);
      MON_AXI_ARUSER : in std_logic_vector(((C_MON_AXI_ARUSER_WIDTH)-1) to 0);
      MON_AXI_ARVALID : in std_logic;
      MON_AXI_ARREADY : in std_logic;
      MON_AXI_RID : in std_logic_vector(((C_MON_AXI_ID_WIDTH)-1) to 0);
      MON_AXI_RDATA : in std_logic_vector(((C_MON_AXI_DATA_WIDTH)-1) downto 0);
      MON_AXI_RRESP : in std_logic_vector(1 downto 0);
      MON_AXI_RLAST : in std_logic;
      MON_AXI_RUSER : in std_logic_vector(((C_MON_AXI_RUSER_WIDTH)-1) to 0);
      MON_AXI_RVALID : in std_logic;
      MON_AXI_RREADY : in std_logic;
      MON_AXI_S_TVALID : in std_logic;
      MON_AXI_S_TREADY : in std_logic;
      MON_AXI_S_TDATA : in std_logic_vector(((C_MON_AXI_S_TDATA_WIDTH)-1) downto 0);
      MON_AXI_S_TKEEP : in std_logic_vector((((C_MON_AXI_S_TDATA_WIDTH)/8)-1) downto 0);
      MON_AXI_S_TLAST : in std_logic;
      MON_AXI_S_TID : in std_logic_vector(((C_MON_AXI_S_TID_WIDTH)-1) to 0);
      MON_AXI_S_TDEST : in std_logic_vector(((C_MON_AXI_S_TDEST_WIDTH)-1) to 0);
      MON_AXI_S_TUSER : in std_logic_vector(((C_MON_AXI_S_TUSER_WIDTH)-1) to 0)
    );
  end component;

begin

  chipscope_axi_monitor_0 : chipscope_axi_monitor
    generic map (
      C_MON_AXI_PROTOCOL => "AXI4LITE",
      C_MON_AXI_S_PROTOCOL => "generic",
      C_USE_INTERFACE => "0",
      C_MON_AXI_PC_NUM_OF_MATCH => 0,
      C_MON_AXI_EN_HANDSHAKE_CHECKS => 0,
      C_MON_AXI_EN_COMPLEX_CHECKS => 0,
      C_MON_AXI_EN_EXCLUSIVE_CHECKS => 0,
      C_MON_AXI_EN_IGNORE_CHECKS => 0,
      C_MON_AXI_EN_ILLEGAL_VALUE_CHECKS => 0,
      C_MON_AXI_EN_RESET_CHECKS => 0,
      C_MON_AXI_EN_AUX_CHECKS => 0,
      C_MON_AXI_EN_ARM_REC_WAIT_CHECKS => 0,
      C_MON_AXI_EN_ARM_REC_ONLY_CHECKS => 0,
      C_MON_AXI_PC_ERROR_COUNT => 95,
      C_MON_AXI_PC_MAXRBURST => 2,
      C_MON_AXI_PC_MAXWBURST => 2,
      C_MON_AXI_PC_EXMON_WIDTH => 1,
      C_MON_AXI_BURST_LENGTH => 8,
      C_MON_AXI_LOCK_LENGTH => 1,
      C_FAMILY => "zynq",
      C_DEVICE => "7z020",
      C_PACKAGE => "clg484",
      C_SPEEDGRADE => "-1",
      C_NUM_DATA_SAMPLES => 1024,
      C_MAX_SEQUENCER_LEVELS => 2,
      C_USE_TRIG_IN => 0,
      C_TRIG_IN_WIDTH => 1,
      C_MON_AXI_SUPPORTS_THREADS => 1,
      C_MON_AXI_ID_WIDTH => 1,
      C_MON_AXI_S_TID_WIDTH => 1,
      C_MON_AXI_ADDR_WIDTH => 32,
      C_MON_AXI_S_TDEST_WIDTH => 1,
      C_MON_AXI_DATA_WIDTH => 32,
      C_MON_AXI_S_TDATA_WIDTH => 32,
      C_MON_AXI_AWUSER_WIDTH => 1,
      C_MON_AXI_WUSER_WIDTH => 1,
      C_MON_AXI_BUSER_WIDTH => 1,
      C_MON_AXI_ARUSER_WIDTH => 1,
      C_MON_AXI_RUSER_WIDTH => 1,
      C_MON_AXI_S_TUSER_WIDTH => 1,
      C_MON_AXI_SUPPORTS_READ => 1,
      C_MON_AXI_SUPPORTS_WRITE => 1,
      C_MON_AXI_GLOBAL_MATCH_TYPE => "basic with edges",
      C_MON_AXI_AWADDRCONTROL_MATCH_TYPE => "basic with edges",
      C_MON_AXI_AWADDR_MATCH_TYPE => "range with edges",
      C_MON_AXI_WDATACONTROL_MATCH_TYPE => "basic with edges",
      C_MON_AXI_WDATA_MATCH_TYPE => "extended with edges",
      C_MON_AXI_BRESP_MATCH_TYPE => "basic with edges",
      C_MON_AXI_ARADDRCONTROL_MATCH_TYPE => "basic with edges",
      C_MON_AXI_ARADDR_MATCH_TYPE => "range with edges",
      C_MON_AXI_RDATACONTROL_MATCH_TYPE => "basic with edges",
      C_MON_AXI_RDATA_MATCH_TYPE => "extended with edges",
      C_MON_AXI_AWUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_WUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_BUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_ARUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_RUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_S_TCONTROL_MATCH_TYPE => "range with edges",
      C_MON_AXI_S_TDATA_MATCH_TYPE => "extended with edges",
      C_MON_AXI_S_TUSER_MATCH_TYPE => "basic with edges",
      C_MON_AXI_PC_MATCH_TYPE => "basic",
      C_MON_AXI_GLOBAL_NUM_OF_MATCH => 1,
      C_MON_AXI_AWADDRCONTROL_NUM_OF_MATCH => 1,
      C_MON_AXI_AWADDR_NUM_OF_MATCH => 1,
      C_MON_AXI_WDATACONTROL_NUM_OF_MATCH => 1,
      C_MON_AXI_WDATA_NUM_OF_MATCH => 1,
      C_MON_AXI_BRESP_NUM_OF_MATCH => 1,
      C_MON_AXI_ARADDRCONTROL_NUM_OF_MATCH => 1,
      C_MON_AXI_ARADDR_NUM_OF_MATCH => 1,
      C_MON_AXI_RDATACONTROL_NUM_OF_MATCH => 1,
      C_MON_AXI_RDATA_NUM_OF_MATCH => 1,
      C_MON_AXI_AWUSER_NUM_OF_MATCH => 0,
      C_MON_AXI_WUSER_NUM_OF_MATCH => 0,
      C_MON_AXI_BUSER_NUM_OF_MATCH => 0,
      C_MON_AXI_ARUSER_NUM_OF_MATCH => 0,
      C_MON_AXI_RUSER_NUM_OF_MATCH => 0,
      C_MON_AXI_S_TCONTROL_NUM_OF_MATCH => 1,
      C_MON_AXI_S_TDATA_NUM_OF_MATCH => 1,
      C_MON_AXI_S_TUSER_NUM_OF_MATCH => 1,
      C_MON_AXI_GLOBAL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_AWADDRCONTROL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_AWADDR_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_WDATACONTROL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_WDATA_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_BRESP_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_ARADDRCONTROL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_ARADDR_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_RDATACONTROL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_RDATA_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_AWUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_WUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_BUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_ARUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_RUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_S_TCONTROL_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_S_TDATA_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_S_TUSER_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_PC_TRIG_COUNT_WIDTH => 1,
      C_MON_AXI_GLOBAL_TRACE => "1",
      C_MON_AXI_AWADDRCONTROL_TRACE => "1",
      C_MON_AXI_AWADDR_TRACE => "1",
      C_MON_AXI_WDATACONTROL_TRACE => "1",
      C_MON_AXI_WDATA_TRACE => "1",
      C_MON_AXI_BRESP_TRACE => "1",
      C_MON_AXI_ARADDRCONTROL_TRACE => "1",
      C_MON_AXI_ARADDR_TRACE => "1",
      C_MON_AXI_RDATACONTROL_TRACE => "1",
      C_MON_AXI_RDATA_TRACE => "1",
      C_MON_AXI_AWUSER_TRACE => "1",
      C_MON_AXI_WUSER_TRACE => "1",
      C_MON_AXI_BUSER_TRACE => "1",
      C_MON_AXI_ARUSER_TRACE => "1",
      C_MON_AXI_RUSER_TRACE => "1",
      C_MON_AXI_S_TCONTROL_TRACE => "1",
      C_MON_AXI_S_TDATA_TRACE => "1",
      C_MON_AXI_S_TUSER_TRACE => "1",
      C_MON_AXI_PC_TRACE => "1"
    )
    port map (
      CHIPSCOPE_ICON_CONTROL => CHIPSCOPE_ICON_CONTROL,
      RESET => RESET,
      MON_AXI_TRIG_OUT => MON_AXI_TRIG_OUT,
      MON_AXI_TRIG_IN => MON_AXI_TRIG_IN,
      MON_AXI_ACLK => MON_AXI_ACLK,
      MON_AXI_ARESETN => MON_AXI_ARESETN,
      MON_AXI_AWID => MON_AXI_AWID,
      MON_AXI_AWADDR => MON_AXI_AWADDR,
      MON_AXI_AWLEN => MON_AXI_AWLEN,
      MON_AXI_AWSIZE => MON_AXI_AWSIZE,
      MON_AXI_AWBURST => MON_AXI_AWBURST,
      MON_AXI_AWLOCK => MON_AXI_AWLOCK,
      MON_AXI_AWCACHE => MON_AXI_AWCACHE,
      MON_AXI_AWPROT => MON_AXI_AWPROT,
      MON_AXI_AWQOS => MON_AXI_AWQOS,
      MON_AXI_AWREGION => MON_AXI_AWREGION,
      MON_AXI_AWUSER => MON_AXI_AWUSER,
      MON_AXI_AWVALID => MON_AXI_AWVALID,
      MON_AXI_AWREADY => MON_AXI_AWREADY,
      MON_AXI_WID => MON_AXI_WID,
      MON_AXI_WDATA => MON_AXI_WDATA,
      MON_AXI_WSTRB => MON_AXI_WSTRB,
      MON_AXI_WLAST => MON_AXI_WLAST,
      MON_AXI_WUSER => MON_AXI_WUSER,
      MON_AXI_WVALID => MON_AXI_WVALID,
      MON_AXI_WREADY => MON_AXI_WREADY,
      MON_AXI_BID => MON_AXI_BID,
      MON_AXI_BRESP => MON_AXI_BRESP,
      MON_AXI_BUSER => MON_AXI_BUSER,
      MON_AXI_BVALID => MON_AXI_BVALID,
      MON_AXI_BREADY => MON_AXI_BREADY,
      MON_AXI_ARID => MON_AXI_ARID,
      MON_AXI_ARADDR => MON_AXI_ARADDR,
      MON_AXI_ARLEN => MON_AXI_ARLEN,
      MON_AXI_ARSIZE => MON_AXI_ARSIZE,
      MON_AXI_ARBURST => MON_AXI_ARBURST,
      MON_AXI_ARLOCK => MON_AXI_ARLOCK,
      MON_AXI_ARCACHE => MON_AXI_ARCACHE,
      MON_AXI_ARPROT => MON_AXI_ARPROT,
      MON_AXI_ARQOS => MON_AXI_ARQOS,
      MON_AXI_ARREGION => MON_AXI_ARREGION,
      MON_AXI_ARUSER => MON_AXI_ARUSER,
      MON_AXI_ARVALID => MON_AXI_ARVALID,
      MON_AXI_ARREADY => MON_AXI_ARREADY,
      MON_AXI_RID => MON_AXI_RID,
      MON_AXI_RDATA => MON_AXI_RDATA,
      MON_AXI_RRESP => MON_AXI_RRESP,
      MON_AXI_RLAST => MON_AXI_RLAST,
      MON_AXI_RUSER => MON_AXI_RUSER,
      MON_AXI_RVALID => MON_AXI_RVALID,
      MON_AXI_RREADY => MON_AXI_RREADY,
      MON_AXI_S_TVALID => MON_AXI_S_TVALID,
      MON_AXI_S_TREADY => MON_AXI_S_TREADY,
      MON_AXI_S_TDATA => MON_AXI_S_TDATA,
      MON_AXI_S_TKEEP => MON_AXI_S_TKEEP,
      MON_AXI_S_TLAST => MON_AXI_S_TLAST,
      MON_AXI_S_TID => MON_AXI_S_TID,
      MON_AXI_S_TDEST => MON_AXI_S_TDEST,
      MON_AXI_S_TUSER => MON_AXI_S_TUSER
    );

end architecture STRUCTURE;

