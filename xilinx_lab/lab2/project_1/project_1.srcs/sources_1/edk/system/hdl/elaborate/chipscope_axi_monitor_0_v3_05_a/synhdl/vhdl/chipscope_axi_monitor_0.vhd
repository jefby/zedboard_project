-- (c) Copyright 2010 - 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library chipscope_axi_monitor_v3_05_a;
use chipscope_axi_monitor_v3_05_a.all;

entity chipscope_axi_monitor is
  generic (
    BUSIF : string := "math_0.S_AXI";
    C_DEVICE : string := "7z020";
    C_FAMILY : string := "zynq";
    C_MAX_SEQUENCER_LEVELS : integer := 2;
    C_MON_AXI_ADDR_WIDTH : integer := 32;
    C_MON_AXI_ARADDRCONTROL_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_ARADDRCONTROL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_ARADDRCONTROL_TRACE : string := "1";
    C_MON_AXI_ARADDRCONTROL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_ARADDR_MATCH_TYPE : string := "range with edges";
    C_MON_AXI_ARADDR_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_ARADDR_TRACE : string := "1";
    C_MON_AXI_ARADDR_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_ARUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_ARUSER_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_ARUSER_TRACE : string := "1";
    C_MON_AXI_ARUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_ARUSER_WIDTH : integer := 1;
    C_MON_AXI_AWADDRCONTROL_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_AWADDRCONTROL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_AWADDRCONTROL_TRACE : string := "1";
    C_MON_AXI_AWADDRCONTROL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_AWADDR_MATCH_TYPE : string := "range with edges";
    C_MON_AXI_AWADDR_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_AWADDR_TRACE : string := "1";
    C_MON_AXI_AWADDR_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_AWUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_AWUSER_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_AWUSER_TRACE : string := "1";
    C_MON_AXI_AWUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_AWUSER_WIDTH : integer := 1;
    C_MON_AXI_BRESP_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_BRESP_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_BRESP_TRACE : string := "1";
    C_MON_AXI_BRESP_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_BURST_LENGTH : integer := 8;
    C_MON_AXI_BUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_BUSER_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_BUSER_TRACE : string := "1";
    C_MON_AXI_BUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_BUSER_WIDTH : integer := 1;
    C_MON_AXI_DATA_WIDTH : integer := 32;
    C_MON_AXI_EN_ARM_REC_ONLY_CHECKS : integer := 0;
    C_MON_AXI_EN_ARM_REC_WAIT_CHECKS : integer := 0;
    C_MON_AXI_EN_AUX_CHECKS : integer := 0;
    C_MON_AXI_EN_COMPLEX_CHECKS : integer := 0;
    C_MON_AXI_EN_EXCLUSIVE_CHECKS : integer := 0;
    C_MON_AXI_EN_HANDSHAKE_CHECKS : integer := 0;
    C_MON_AXI_EN_IGNORE_CHECKS : integer := 0;
    C_MON_AXI_EN_ILLEGAL_VALUE_CHECKS : integer := 0;
    C_MON_AXI_EN_RESET_CHECKS : integer := 0;
    C_MON_AXI_GLOBAL_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_GLOBAL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_GLOBAL_TRACE : string := "1";
    C_MON_AXI_GLOBAL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_ID_WIDTH : integer := 1;
    C_MON_AXI_LOCK_LENGTH : integer := 1;
    C_MON_AXI_PC_ERROR_COUNT : integer := 95;
    C_MON_AXI_PC_EXMON_WIDTH : integer := 1;
    C_MON_AXI_PC_MATCH_TYPE : string := "basic";
    C_MON_AXI_PC_MAXRBURST : integer := 2;
    C_MON_AXI_PC_MAXWBURST : integer := 2;
    C_MON_AXI_PC_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_PC_TRACE : string := "1";
    C_MON_AXI_PC_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_PROTOCOL : string := "AXI4LITE";
    C_MON_AXI_RDATACONTROL_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_RDATACONTROL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_RDATACONTROL_TRACE : string := "1";
    C_MON_AXI_RDATACONTROL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_RDATA_MATCH_TYPE : string := "extended with edges";
    C_MON_AXI_RDATA_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_RDATA_TRACE : string := "1";
    C_MON_AXI_RDATA_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_RUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_RUSER_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_RUSER_TRACE : string := "1";
    C_MON_AXI_RUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_RUSER_WIDTH : integer := 1;
    C_MON_AXI_SUPPORTS_READ : integer := 1;
    C_MON_AXI_SUPPORTS_THREADS : integer := 1;
    C_MON_AXI_SUPPORTS_WRITE : integer := 1;
    C_MON_AXI_S_PROTOCOL : string := "generic";
    C_MON_AXI_S_TCONTROL_MATCH_TYPE : string := "range with edges";
    C_MON_AXI_S_TCONTROL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_S_TCONTROL_TRACE : string := "1";
    C_MON_AXI_S_TCONTROL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_S_TDATA_MATCH_TYPE : string := "extended with edges";
    C_MON_AXI_S_TDATA_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_S_TDATA_TRACE : string := "1";
    C_MON_AXI_S_TDATA_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_S_TDATA_WIDTH : integer := 32;
    C_MON_AXI_S_TDEST_WIDTH : integer := 1;
    C_MON_AXI_S_TID_WIDTH : integer := 1;
    C_MON_AXI_S_TUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_S_TUSER_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_S_TUSER_TRACE : string := "1";
    C_MON_AXI_S_TUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_S_TUSER_WIDTH : integer := 1;
    C_MON_AXI_WDATACONTROL_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_WDATACONTROL_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_WDATACONTROL_TRACE : string := "1";
    C_MON_AXI_WDATACONTROL_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_WDATA_MATCH_TYPE : string := "extended with edges";
    C_MON_AXI_WDATA_NUM_OF_MATCH : integer := 1;
    C_MON_AXI_WDATA_TRACE : string := "1";
    C_MON_AXI_WDATA_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_WUSER_MATCH_TYPE : string := "basic with edges";
    C_MON_AXI_WUSER_NUM_OF_MATCH : integer := 0;
    C_MON_AXI_WUSER_TRACE : string := "1";
    C_MON_AXI_WUSER_TRIG_COUNT_WIDTH : integer := 1;
    C_MON_AXI_WUSER_WIDTH : integer := 1;
    C_NUM_DATA_SAMPLES : integer := 1024;
    C_PACKAGE : string := "clg484";
    C_SPEEDGRADE : string := "-1";
    C_TRIG_IN_WIDTH : integer := 1;
    C_USE_INTERFACE : string := "0";
    C_USE_TRIG_IN : integer := 0;
    INSTANCE : string := "chipscope_axi_monitor_0"
  );
  port (
    CHIPSCOPE_ICON_CONTROL : in std_logic_vector(35 downto 0);
    MON_AXI_ACLK : in std_logic;
    MON_AXI_ARADDR : in std_logic_vector(31 downto 0);
    MON_AXI_ARBURST : in std_logic_vector(1 downto 0);
    MON_AXI_ARCACHE : in std_logic_vector(3 downto 0);
    MON_AXI_ARESETN : in std_logic;
    MON_AXI_ARID : in std_logic_vector(0 downto 0);
    MON_AXI_ARLEN : in std_logic_vector(7 downto 0);
    MON_AXI_ARLOCK : in std_logic_vector(0 downto 0);
    MON_AXI_ARPROT : in std_logic_vector(2 downto 0);
    MON_AXI_ARQOS : in std_logic_vector(3 downto 0);
    MON_AXI_ARREADY : in std_logic;
    MON_AXI_ARREGION : in std_logic_vector(3 downto 0);
    MON_AXI_ARSIZE : in std_logic_vector(2 downto 0);
    MON_AXI_ARUSER : in std_logic_vector(0 downto 0);
    MON_AXI_ARVALID : in std_logic;
    MON_AXI_AWADDR : in std_logic_vector(31 downto 0);
    MON_AXI_AWBURST : in std_logic_vector(1 downto 0);
    MON_AXI_AWCACHE : in std_logic_vector(3 downto 0);
    MON_AXI_AWID : in std_logic_vector(0 downto 0);
    MON_AXI_AWLEN : in std_logic_vector(7 downto 0);
    MON_AXI_AWLOCK : in std_logic_vector(0 downto 0);
    MON_AXI_AWPROT : in std_logic_vector(2 downto 0);
    MON_AXI_AWQOS : in std_logic_vector(3 downto 0);
    MON_AXI_AWREADY : in std_logic;
    MON_AXI_AWREGION : in std_logic_vector(3 downto 0);
    MON_AXI_AWSIZE : in std_logic_vector(2 downto 0);
    MON_AXI_AWUSER : in std_logic_vector(0 downto 0);
    MON_AXI_AWVALID : in std_logic;
    MON_AXI_BID : in std_logic_vector(0 downto 0);
    MON_AXI_BREADY : in std_logic;
    MON_AXI_BRESP : in std_logic_vector(1 downto 0);
    MON_AXI_BUSER : in std_logic_vector(0 downto 0);
    MON_AXI_BVALID : in std_logic;
    MON_AXI_RDATA : in std_logic_vector(31 downto 0);
    MON_AXI_RID : in std_logic_vector(0 downto 0);
    MON_AXI_RLAST : in std_logic;
    MON_AXI_RREADY : in std_logic;
    MON_AXI_RRESP : in std_logic_vector(1 downto 0);
    MON_AXI_RUSER : in std_logic_vector(0 downto 0);
    MON_AXI_RVALID : in std_logic;
    MON_AXI_S_TDATA : in std_logic_vector(31 downto 0);
    MON_AXI_S_TDEST : in std_logic_vector(0 downto 0);
    MON_AXI_S_TID : in std_logic_vector(0 downto 0);
    MON_AXI_S_TKEEP : in std_logic_vector(3 downto 0);
    MON_AXI_S_TLAST : in std_logic;
    MON_AXI_S_TREADY : in std_logic;
    MON_AXI_S_TUSER : in std_logic_vector(0 downto 0);
    MON_AXI_S_TVALID : in std_logic;
    MON_AXI_TRIG_IN : in std_logic_vector(0 downto 0);
    MON_AXI_TRIG_OUT : out std_logic;
    MON_AXI_WDATA : in std_logic_vector(31 downto 0);
    MON_AXI_WID : in std_logic_vector(0 downto 0);
    MON_AXI_WLAST : in std_logic;
    MON_AXI_WREADY : in std_logic;
    MON_AXI_WSTRB : in std_logic_vector(3 downto 0);
    MON_AXI_WUSER : in std_logic_vector(0 downto 0);
    MON_AXI_WVALID : in std_logic;
    RESET : in std_logic
  );
end entity chipscope_axi_monitor;



architecture STRUCTURE of chipscope_axi_monitor  is

component chipscope_axi_monitor_0 is
  port (
    CLK : in std_logic;
    CONTROL : in std_logic_vector(35 downto 0);
    DATA : in std_logic_vector(152 downto 0);
    TRIG0 : in std_logic_vector(31 downto 0);
    TRIG1 : in std_logic_vector(4 downto 0);
    TRIG2 : in std_logic_vector(31 downto 0);
    TRIG3 : in std_logic_vector(4 downto 0);
    TRIG4 : in std_logic_vector(3 downto 0);
    TRIG5 : in std_logic_vector(0 downto 0);
    TRIG6 : in std_logic_vector(31 downto 0);
    TRIG7 : in std_logic_vector(3 downto 0);
    TRIG8 : in std_logic_vector(31 downto 0);
    TRIG9 : in std_logic_vector(5 downto 0);
    TRIG_OUT : out std_logic
  );
end component;


--Write PC Component the PC if enabled
 

  signal data_TRIG_SIGNAL : std_logic_vector(152 downto 0);
  signal MON_AXI_AWADDRCONTROL_TRIG_SIGNAL : std_logic_vector(4 downto 0);
  signal MON_AXI_RDATACONTROL_TRIG_SIGNAL : std_logic_vector(3 downto 0);
  signal MON_AXI_ARADDR_TRIG_SIGNAL : std_logic_vector(31 downto 0);
  signal MON_AXI_BRESP_TRIG_SIGNAL : std_logic_vector(3 downto 0);
  signal MON_AXI_WDATA_TRIG_SIGNAL : std_logic_vector(31 downto 0);
  signal MON_AXI_WDATACONTROL_TRIG_SIGNAL : std_logic_vector(5 downto 0);
  signal MON_AXI_ARADDRCONTROL_TRIG_SIGNAL : std_logic_vector(4 downto 0);
  signal MON_AXI_GLOBAL_TRIG_SIGNAL : std_logic_vector(0 downto 0);
  signal MON_AXI_AWADDR_TRIG_SIGNAL : std_logic_vector(31 downto 0);
  signal MON_AXI_RDATA_TRIG_SIGNAL : std_logic_vector(31 downto 0);


        signal PC_ERROR_OR_ALL             : std_logic;
        signal PC_ERROR_BUS                : std_logic_vector(94 downto 0);
        signal PC_ERROR_HANDSHAKE_OR       : std_logic;
        signal PC_ERROR_COMPLEX_OR         : std_logic;
        signal PC_ERROR_EXCLUSIVE_OR       : std_logic;
        signal PC_ERROR_IGNORE_OR          : std_logic;
        signal PC_ERROR_ILLEGAL_VALUE_OR   : std_logic;
        signal PC_ERROR_RESET_OR           : std_logic;
        signal PC_ERROR_AUXILIARY_OR       : std_logic;
        signal PC_ERROR_ARM_REC_OR         : std_logic;
        signal PC_ERROR_ARM_REC_WAIT_OR    : std_logic;
        signal AXI4_ERRM_AWADDR_STABLE     : std_logic;
        signal AXI4_ERRM_AWBURST_STABLE    : std_logic;
        signal AXI4_ERRM_AWCACHE_STABLE    : std_logic;
        signal AXI4_ERRM_AWID_STABLE       : std_logic;
        signal AXI4_ERRM_AWLEN_STABLE      : std_logic;
        signal AXI4_ERRM_AWLOCK_STABLE     : std_logic;
        signal AXI4_ERRM_AWPROT_STABLE     : std_logic;
        signal AXI4_ERRM_AWSIZE_STABLE     : std_logic;
        signal AXI4_ERRM_AWQOS_STABLE      : std_logic;
        signal AXI4_ERRM_AWREGION_STABLE   : std_logic;
        signal AXI4_ERRM_AWVALID_STABLE    : std_logic;
        signal AXI4_ERRM_WDATA_STABLE      : std_logic;
        signal AXI4_ERRM_WLAST_STABLE      : std_logic;
        signal AXI4_ERRM_WSTRB_STABLE      : std_logic;
        signal AXI4_ERRM_WVALID_STABLE     : std_logic;
        signal AXI4_ERRS_BID_STABLE        : std_logic;
        signal AXI4_ERRS_BRESP_STABLE      : std_logic;
        signal AXI4_ERRS_BVALID_STABLE     : std_logic;
        signal AXI4_ERRM_ARADDR_STABLE     : std_logic;
        signal AXI4_ERRM_ARBURST_STABLE    : std_logic;
        signal AXI4_ERRM_ARCACHE_STABLE    : std_logic;
        signal AXI4_ERRM_ARID_STABLE       : std_logic;
        signal AXI4_ERRM_ARLEN_STABLE      : std_logic;
        signal AXI4_ERRM_ARLOCK_STABLE     : std_logic;
        signal AXI4_ERRM_ARPROT_STABLE     : std_logic;
        signal AXI4_ERRM_ARSIZE_STABLE     : std_logic;
        signal AXI4_ERRM_ARQOS_STABLE      : std_logic;
        signal AXI4_ERRM_ARREGION_STABLE   : std_logic;
        signal AXI4_ERRM_ARVALID_STABLE    : std_logic;
        signal AXI4_ERRS_RDATA_STABLE      : std_logic;
        signal AXI4_ERRS_RID_STABLE        : std_logic;
        signal AXI4_ERRS_RLAST_STABLE      : std_logic;
        signal AXI4_ERRS_RRESP_STABLE      : std_logic;
        signal AXI4_ERRS_RVALID_STABLE     : std_logic;
        signal AXI4_ERRM_AWUSER_STABLE     : std_logic;
        signal AXI4_ERRM_WUSER_STABLE      : std_logic;
        signal AXI4_ERRS_BUSER_STABLE      : std_logic;
        signal AXI4_ERRM_ARUSER_STABLE     : std_logic;
        signal AXI4_ERRS_RUSER_STABLE      : std_logic;
        signal AXI4_ERRM_WDATA_NUM         : std_logic;
        signal AXI4_ERRS_BRESP_WLAST       : std_logic;
        signal AXI4_ERRS_BRESP_AW          : std_logic;
        signal AXI4_ERRS_RDATA_NUM         : std_logic;
        signal AXI4_ERRS_RID               : std_logic;
        signal AXI4_ERRM_AWLEN_LOCK        : std_logic;
        signal AXI4_ERRS_BRESP_EXOKAY      : std_logic;
        signal AXI4_ERRM_ARLEN_LOCK        : std_logic;
        signal AXI4_ERRS_RRESP_EXOKAY      : std_logic;
        signal AXI4_ERRM_EXCL_ALIGN        : std_logic;
        signal AXI4_ERRM_EXCL_LEN          : std_logic;
        signal AXI4_RECM_EXCL_MATCH        : std_logic;
        signal AXI4_ERRM_EXCL_MAX          : std_logic;
        signal AXI4_RECM_EXCL_PAIR         : std_logic;
        signal AXI4_RECS_AWREADY_MAX_WAIT  : std_logic;
        signal AXI4_RECS_WREADY_MAX_WAIT   : std_logic;
        signal AXI4_RECM_BREADY_MAX_WAIT   : std_logic;
        signal AXI4_RECS_ARREADY_MAX_WAIT  : std_logic;
        signal AXI4_RECM_RREADY_MAX_WAIT   : std_logic;
        signal AXI4_ERRM_AWUSER_TIEOFF     : std_logic;
        signal AXI4_ERRM_WUSER_TIEOFF      : std_logic;
        signal AXI4_ERRS_BUSER_TIEOFF      : std_logic;
        signal AXI4_ERRM_ARUSER_TIEOFF     : std_logic;
        signal AXI4_ERRS_RUSER_TIEOFF      : std_logic;
        signal AXI4_ERRM_AWID_TIEOFF       : std_logic;
        signal AXI4_ERRS_BID_TIEOFF        : std_logic;
        signal AXI4_ERRM_ARID_TIEOFF       : std_logic;
        signal AXI4_ERRS_RID_TIEOFF        : std_logic;
        signal AXI4LITE_AUXM_DATA_WIDTH    : std_logic;
        signal AXI4_ERRM_AWADDR_BOUNDARY   : std_logic;
        signal AXI4_ERRM_AWADDR_WRAP_ALIGN : std_logic;
        signal AXI4_ERRM_AWBURST           : std_logic;
        signal AXI4_ERRM_AWCACHE           : std_logic;
        signal AXI4_ERRM_AWLEN_FIXED       : std_logic;
        signal AXI4_ERRM_AWLEN_WRAP        : std_logic;
        signal AXI4_ERRM_AWSIZE            : std_logic;
        signal AXI4_ERRM_WSTRB             : std_logic;
        signal AXI4_ERRM_ARADDR_BOUNDARY   : std_logic;
        signal AXI4_ERRM_ARADDR_WRAP_ALIGN : std_logic;
        signal AXI4_ERRM_ARBURST           : std_logic;
        signal AXI4_ERRM_ARLEN_WRAP        : std_logic;
        signal AXI4_ERRM_ARSIZE            : std_logic;
        signal AXI4_ERRM_ARCACHE           : std_logic;
        signal AXI4_ERRM_ARLEN_FIXED       : std_logic;
        signal AXI4LITE_ERRS_BRESP_EXOKAY  : std_logic;
        signal AXI4LITE_ERRS_RRESP_EXOKAY  : std_logic;
        signal AXI4_ERRM_AWVALID_RESET     : std_logic;
        signal AXI4_ERRM_WVALID_RESET      : std_logic;
        signal AXI4_ERRS_BVALID_RESET      : std_logic;
        signal AXI4_ERRM_ARVALID_RESET     : std_logic;
        signal AXI4_ERRS_RVALID_RESET      : std_logic;
        signal AXI4_AUXM_RCAM_OVERFLOW     : std_logic;
        signal AXI4_AUXM_RCAM_UNDERFLOW    : std_logic;
        signal AXI4_AUXM_WCAM_OVERFLOW     : std_logic;
        signal AXI4_AUXM_WCAM_UNDERFLOW    : std_logic;
        signal AXI4_AUXM_EXCL_OVERFLOW     : std_logic;
  
begin

  -- connect up trig ports from input ports
        AXI4_ERRM_AWADDR_STABLE     <= PC_ERROR_BUS(9);
        AXI4_ERRM_AWBURST_STABLE    <= PC_ERROR_BUS(10);
        AXI4_ERRM_AWCACHE_STABLE    <= PC_ERROR_BUS(11);
        AXI4_ERRM_AWID_STABLE       <= PC_ERROR_BUS(12);
        AXI4_ERRM_AWLEN_STABLE      <= PC_ERROR_BUS(13);
        AXI4_ERRM_AWLOCK_STABLE     <= PC_ERROR_BUS(14);
        AXI4_ERRM_AWPROT_STABLE     <= PC_ERROR_BUS(15);
        AXI4_ERRM_AWSIZE_STABLE     <= PC_ERROR_BUS(16);
        AXI4_ERRM_AWQOS_STABLE      <= PC_ERROR_BUS(17);
        AXI4_ERRM_AWREGION_STABLE   <= PC_ERROR_BUS(18);
        AXI4_ERRM_AWVALID_STABLE    <= PC_ERROR_BUS(19);
        AXI4_ERRM_WDATA_STABLE      <= PC_ERROR_BUS(24);
        AXI4_ERRM_WLAST_STABLE      <= PC_ERROR_BUS(25);
        AXI4_ERRM_WSTRB_STABLE      <= PC_ERROR_BUS(26);
        AXI4_ERRM_WVALID_STABLE     <= PC_ERROR_BUS(27);
        AXI4_ERRS_BID_STABLE        <= PC_ERROR_BUS(33);
        AXI4_ERRS_BRESP_STABLE      <= PC_ERROR_BUS(34);
        AXI4_ERRS_BVALID_STABLE     <= PC_ERROR_BUS(35);
        AXI4_ERRM_ARADDR_STABLE     <= PC_ERROR_BUS(46);
        AXI4_ERRM_ARBURST_STABLE    <= PC_ERROR_BUS(47);
        AXI4_ERRM_ARCACHE_STABLE    <= PC_ERROR_BUS(48);
        AXI4_ERRM_ARID_STABLE       <= PC_ERROR_BUS(49);
        AXI4_ERRM_ARLEN_STABLE      <= PC_ERROR_BUS(50);
        AXI4_ERRM_ARLOCK_STABLE     <= PC_ERROR_BUS(51);
        AXI4_ERRM_ARPROT_STABLE     <= PC_ERROR_BUS(52);
        AXI4_ERRM_ARSIZE_STABLE     <= PC_ERROR_BUS(53);
        AXI4_ERRM_ARQOS_STABLE      <= PC_ERROR_BUS(54);
        AXI4_ERRM_ARREGION_STABLE   <= PC_ERROR_BUS(55);
        AXI4_ERRM_ARVALID_STABLE    <= PC_ERROR_BUS(56);
        AXI4_ERRS_RDATA_STABLE      <= PC_ERROR_BUS(62);
        AXI4_ERRS_RID_STABLE        <= PC_ERROR_BUS(63);
        AXI4_ERRS_RLAST_STABLE      <= PC_ERROR_BUS(64);
        AXI4_ERRS_RRESP_STABLE      <= PC_ERROR_BUS(65);
        AXI4_ERRS_RVALID_STABLE     <= PC_ERROR_BUS(66);
        AXI4_ERRM_AWUSER_STABLE     <= PC_ERROR_BUS(73);
        AXI4_ERRM_WUSER_STABLE      <= PC_ERROR_BUS(74);
        AXI4_ERRS_BUSER_STABLE      <= PC_ERROR_BUS(75);
        AXI4_ERRM_ARUSER_STABLE     <= PC_ERROR_BUS(76);
        AXI4_ERRS_RUSER_STABLE      <= PC_ERROR_BUS(77);
        
        AXI4_ERRM_WDATA_NUM         <= PC_ERROR_BUS(21);
        AXI4_ERRS_BRESP_WLAST       <= PC_ERROR_BUS(29);
        AXI4_ERRS_BRESP_AW          <= PC_ERROR_BUS(32);
        AXI4_ERRS_RDATA_NUM         <= PC_ERROR_BUS(58);
        AXI4_ERRS_RID               <= PC_ERROR_BUS(59);
        
        AXI4_ERRM_AWLEN_LOCK        <= PC_ERROR_BUS(3);
        AXI4_ERRS_BRESP_EXOKAY      <= PC_ERROR_BUS(30);
        AXI4_ERRM_ARLEN_LOCK        <= PC_ERROR_BUS(40);
        AXI4_ERRS_RRESP_EXOKAY      <= PC_ERROR_BUS(60);
        AXI4_ERRM_EXCL_ALIGN        <= PC_ERROR_BUS(68);
        AXI4_ERRM_EXCL_LEN          <= PC_ERROR_BUS(69);
        AXI4_RECM_EXCL_MATCH        <= PC_ERROR_BUS(70);
        AXI4_ERRM_EXCL_MAX          <= PC_ERROR_BUS(71);
        AXI4_RECM_EXCL_PAIR         <= PC_ERROR_BUS(72);
        
        AXI4_RECS_AWREADY_MAX_WAIT  <= PC_ERROR_BUS(20);
        AXI4_RECS_WREADY_MAX_WAIT   <= PC_ERROR_BUS(28);
        AXI4_RECM_BREADY_MAX_WAIT   <= PC_ERROR_BUS(36);
        AXI4_RECS_ARREADY_MAX_WAIT  <= PC_ERROR_BUS(57);
        AXI4_RECM_RREADY_MAX_WAIT   <= PC_ERROR_BUS(67);
        AXI4_ERRM_AWUSER_TIEOFF     <= PC_ERROR_BUS(78);
        AXI4_ERRM_WUSER_TIEOFF      <= PC_ERROR_BUS(79);
        AXI4_ERRS_BUSER_TIEOFF      <= PC_ERROR_BUS(80);
        AXI4_ERRM_ARUSER_TIEOFF     <= PC_ERROR_BUS(81);
        AXI4_ERRS_RUSER_TIEOFF      <= PC_ERROR_BUS(82);
        AXI4_ERRM_AWID_TIEOFF       <= PC_ERROR_BUS(83);
        AXI4_ERRS_BID_TIEOFF        <= PC_ERROR_BUS(84);
        AXI4_ERRM_ARID_TIEOFF       <= PC_ERROR_BUS(85);
        AXI4_ERRS_RID_TIEOFF        <= PC_ERROR_BUS(86);
        AXI4LITE_AUXM_DATA_WIDTH    <= PC_ERROR_BUS(94);
        
        AXI4_ERRM_AWADDR_BOUNDARY   <= PC_ERROR_BUS(0);
        AXI4_ERRM_AWADDR_WRAP_ALIGN <= PC_ERROR_BUS(1);
        AXI4_ERRM_AWBURST           <= PC_ERROR_BUS(2);
        AXI4_ERRM_AWCACHE           <= PC_ERROR_BUS(4);
        AXI4_ERRM_AWLEN_FIXED       <= PC_ERROR_BUS(5);
        AXI4_ERRM_AWLEN_WRAP        <= PC_ERROR_BUS(6);
        AXI4_ERRM_AWSIZE            <= PC_ERROR_BUS(7);
        AXI4_ERRM_WSTRB             <= PC_ERROR_BUS(22);
        AXI4_ERRM_ARADDR_BOUNDARY   <= PC_ERROR_BUS(37);
        AXI4_ERRM_ARADDR_WRAP_ALIGN <= PC_ERROR_BUS(38);
        AXI4_ERRM_ARBURST           <= PC_ERROR_BUS(39);
        AXI4_ERRM_ARLEN_WRAP        <= PC_ERROR_BUS(43);
        AXI4_ERRM_ARSIZE            <= PC_ERROR_BUS(44);
        AXI4_ERRM_ARCACHE           <= PC_ERROR_BUS(41);
        AXI4_ERRM_ARLEN_FIXED       <= PC_ERROR_BUS(42);
        AXI4LITE_ERRS_BRESP_EXOKAY  <= PC_ERROR_BUS(92);
        AXI4LITE_ERRS_RRESP_EXOKAY  <= PC_ERROR_BUS(93);
        
        AXI4_ERRM_AWVALID_RESET     <= PC_ERROR_BUS(8);
        AXI4_ERRM_WVALID_RESET      <= PC_ERROR_BUS(23);
        AXI4_ERRS_BVALID_RESET      <= PC_ERROR_BUS(31);
        AXI4_ERRM_ARVALID_RESET     <= PC_ERROR_BUS(45);
        AXI4_ERRS_RVALID_RESET      <= PC_ERROR_BUS(61);
        
        AXI4_AUXM_RCAM_OVERFLOW     <= PC_ERROR_BUS(87);
        AXI4_AUXM_RCAM_UNDERFLOW    <= PC_ERROR_BUS(88);
        AXI4_AUXM_WCAM_OVERFLOW     <= PC_ERROR_BUS(89);
        AXI4_AUXM_WCAM_UNDERFLOW    <= PC_ERROR_BUS(90);
        AXI4_AUXM_EXCL_OVERFLOW     <= PC_ERROR_BUS(91);


  data_TRIG_SIGNAL <=
     (
      MON_AXI_WVALID,
      MON_AXI_WSTRB(3),
      MON_AXI_WSTRB(2),
      MON_AXI_WSTRB(1),
      MON_AXI_WSTRB(0),
      MON_AXI_WREADY,
      MON_AXI_WDATA(31),
      MON_AXI_WDATA(30),
      MON_AXI_WDATA(29),
      MON_AXI_WDATA(28),
      MON_AXI_WDATA(27),
      MON_AXI_WDATA(26),
      MON_AXI_WDATA(25),
      MON_AXI_WDATA(24),
      MON_AXI_WDATA(23),
      MON_AXI_WDATA(22),
      MON_AXI_WDATA(21),
      MON_AXI_WDATA(20),
      MON_AXI_WDATA(19),
      MON_AXI_WDATA(18),
      MON_AXI_WDATA(17),
      MON_AXI_WDATA(16),
      MON_AXI_WDATA(15),
      MON_AXI_WDATA(14),
      MON_AXI_WDATA(13),
      MON_AXI_WDATA(12),
      MON_AXI_WDATA(11),
      MON_AXI_WDATA(10),
      MON_AXI_WDATA(9),
      MON_AXI_WDATA(8),
      MON_AXI_WDATA(7),
      MON_AXI_WDATA(6),
      MON_AXI_WDATA(5),
      MON_AXI_WDATA(4),
      MON_AXI_WDATA(3),
      MON_AXI_WDATA(2),
      MON_AXI_WDATA(1),
      MON_AXI_WDATA(0),
      MON_AXI_RVALID,
      MON_AXI_RRESP(1),
      MON_AXI_RRESP(0),
      MON_AXI_RREADY,
      MON_AXI_RDATA(31),
      MON_AXI_RDATA(30),
      MON_AXI_RDATA(29),
      MON_AXI_RDATA(28),
      MON_AXI_RDATA(27),
      MON_AXI_RDATA(26),
      MON_AXI_RDATA(25),
      MON_AXI_RDATA(24),
      MON_AXI_RDATA(23),
      MON_AXI_RDATA(22),
      MON_AXI_RDATA(21),
      MON_AXI_RDATA(20),
      MON_AXI_RDATA(19),
      MON_AXI_RDATA(18),
      MON_AXI_RDATA(17),
      MON_AXI_RDATA(16),
      MON_AXI_RDATA(15),
      MON_AXI_RDATA(14),
      MON_AXI_RDATA(13),
      MON_AXI_RDATA(12),
      MON_AXI_RDATA(11),
      MON_AXI_RDATA(10),
      MON_AXI_RDATA(9),
      MON_AXI_RDATA(8),
      MON_AXI_RDATA(7),
      MON_AXI_RDATA(6),
      MON_AXI_RDATA(5),
      MON_AXI_RDATA(4),
      MON_AXI_RDATA(3),
      MON_AXI_RDATA(2),
      MON_AXI_RDATA(1),
      MON_AXI_RDATA(0),
      MON_AXI_ARESETN,
      MON_AXI_BVALID,
      MON_AXI_BRESP(1),
      MON_AXI_BRESP(0),
      MON_AXI_BREADY,
      MON_AXI_AWVALID,
      MON_AXI_AWREADY,
      MON_AXI_AWPROT(2),
      MON_AXI_AWPROT(1),
      MON_AXI_AWPROT(0),
      MON_AXI_AWADDR(31),
      MON_AXI_AWADDR(30),
      MON_AXI_AWADDR(29),
      MON_AXI_AWADDR(28),
      MON_AXI_AWADDR(27),
      MON_AXI_AWADDR(26),
      MON_AXI_AWADDR(25),
      MON_AXI_AWADDR(24),
      MON_AXI_AWADDR(23),
      MON_AXI_AWADDR(22),
      MON_AXI_AWADDR(21),
      MON_AXI_AWADDR(20),
      MON_AXI_AWADDR(19),
      MON_AXI_AWADDR(18),
      MON_AXI_AWADDR(17),
      MON_AXI_AWADDR(16),
      MON_AXI_AWADDR(15),
      MON_AXI_AWADDR(14),
      MON_AXI_AWADDR(13),
      MON_AXI_AWADDR(12),
      MON_AXI_AWADDR(11),
      MON_AXI_AWADDR(10),
      MON_AXI_AWADDR(9),
      MON_AXI_AWADDR(8),
      MON_AXI_AWADDR(7),
      MON_AXI_AWADDR(6),
      MON_AXI_AWADDR(5),
      MON_AXI_AWADDR(4),
      MON_AXI_AWADDR(3),
      MON_AXI_AWADDR(2),
      MON_AXI_AWADDR(1),
      MON_AXI_AWADDR(0),
      MON_AXI_ARVALID,
      MON_AXI_ARREADY,
      MON_AXI_ARPROT(2),
      MON_AXI_ARPROT(1),
      MON_AXI_ARPROT(0),
      MON_AXI_ARADDR(31),
      MON_AXI_ARADDR(30),
      MON_AXI_ARADDR(29),
      MON_AXI_ARADDR(28),
      MON_AXI_ARADDR(27),
      MON_AXI_ARADDR(26),
      MON_AXI_ARADDR(25),
      MON_AXI_ARADDR(24),
      MON_AXI_ARADDR(23),
      MON_AXI_ARADDR(22),
      MON_AXI_ARADDR(21),
      MON_AXI_ARADDR(20),
      MON_AXI_ARADDR(19),
      MON_AXI_ARADDR(18),
      MON_AXI_ARADDR(17),
      MON_AXI_ARADDR(16),
      MON_AXI_ARADDR(15),
      MON_AXI_ARADDR(14),
      MON_AXI_ARADDR(13),
      MON_AXI_ARADDR(12),
      MON_AXI_ARADDR(11),
      MON_AXI_ARADDR(10),
      MON_AXI_ARADDR(9),
      MON_AXI_ARADDR(8),
      MON_AXI_ARADDR(7),
      MON_AXI_ARADDR(6),
      MON_AXI_ARADDR(5),
      MON_AXI_ARADDR(4),
      MON_AXI_ARADDR(3),
      MON_AXI_ARADDR(2),
      MON_AXI_ARADDR(1),
      MON_AXI_ARADDR(0)
     );
  MON_AXI_AWADDRCONTROL_TRIG_SIGNAL <=
     (
      MON_AXI_AWVALID,
      MON_AXI_AWREADY,
      MON_AXI_AWPROT(2),
      MON_AXI_AWPROT(1),
      MON_AXI_AWPROT(0)
     );
  MON_AXI_RDATACONTROL_TRIG_SIGNAL <=
     (
      MON_AXI_RVALID,
      MON_AXI_RRESP(1),
      MON_AXI_RRESP(0),
      MON_AXI_RREADY
     );
  MON_AXI_ARADDR_TRIG_SIGNAL <=
     (
      MON_AXI_ARADDR(31),
      MON_AXI_ARADDR(30),
      MON_AXI_ARADDR(29),
      MON_AXI_ARADDR(28),
      MON_AXI_ARADDR(27),
      MON_AXI_ARADDR(26),
      MON_AXI_ARADDR(25),
      MON_AXI_ARADDR(24),
      MON_AXI_ARADDR(23),
      MON_AXI_ARADDR(22),
      MON_AXI_ARADDR(21),
      MON_AXI_ARADDR(20),
      MON_AXI_ARADDR(19),
      MON_AXI_ARADDR(18),
      MON_AXI_ARADDR(17),
      MON_AXI_ARADDR(16),
      MON_AXI_ARADDR(15),
      MON_AXI_ARADDR(14),
      MON_AXI_ARADDR(13),
      MON_AXI_ARADDR(12),
      MON_AXI_ARADDR(11),
      MON_AXI_ARADDR(10),
      MON_AXI_ARADDR(9),
      MON_AXI_ARADDR(8),
      MON_AXI_ARADDR(7),
      MON_AXI_ARADDR(6),
      MON_AXI_ARADDR(5),
      MON_AXI_ARADDR(4),
      MON_AXI_ARADDR(3),
      MON_AXI_ARADDR(2),
      MON_AXI_ARADDR(1),
      MON_AXI_ARADDR(0)
     );
  MON_AXI_BRESP_TRIG_SIGNAL <=
     (
      MON_AXI_BVALID,
      MON_AXI_BRESP(1),
      MON_AXI_BRESP(0),
      MON_AXI_BREADY
     );
  MON_AXI_WDATA_TRIG_SIGNAL <=
     (
      MON_AXI_WDATA(31),
      MON_AXI_WDATA(30),
      MON_AXI_WDATA(29),
      MON_AXI_WDATA(28),
      MON_AXI_WDATA(27),
      MON_AXI_WDATA(26),
      MON_AXI_WDATA(25),
      MON_AXI_WDATA(24),
      MON_AXI_WDATA(23),
      MON_AXI_WDATA(22),
      MON_AXI_WDATA(21),
      MON_AXI_WDATA(20),
      MON_AXI_WDATA(19),
      MON_AXI_WDATA(18),
      MON_AXI_WDATA(17),
      MON_AXI_WDATA(16),
      MON_AXI_WDATA(15),
      MON_AXI_WDATA(14),
      MON_AXI_WDATA(13),
      MON_AXI_WDATA(12),
      MON_AXI_WDATA(11),
      MON_AXI_WDATA(10),
      MON_AXI_WDATA(9),
      MON_AXI_WDATA(8),
      MON_AXI_WDATA(7),
      MON_AXI_WDATA(6),
      MON_AXI_WDATA(5),
      MON_AXI_WDATA(4),
      MON_AXI_WDATA(3),
      MON_AXI_WDATA(2),
      MON_AXI_WDATA(1),
      MON_AXI_WDATA(0)
     );
  MON_AXI_WDATACONTROL_TRIG_SIGNAL <=
     (
      MON_AXI_WVALID,
      MON_AXI_WSTRB(3),
      MON_AXI_WSTRB(2),
      MON_AXI_WSTRB(1),
      MON_AXI_WSTRB(0),
      MON_AXI_WREADY
     );
  MON_AXI_ARADDRCONTROL_TRIG_SIGNAL <=
     (
      MON_AXI_ARVALID,
      MON_AXI_ARREADY,
      MON_AXI_ARPROT(2),
      MON_AXI_ARPROT(1),
      MON_AXI_ARPROT(0)
     );
  MON_AXI_GLOBAL_TRIG_SIGNAL(0) <= MON_AXI_ARESETN;
  MON_AXI_AWADDR_TRIG_SIGNAL <=
     (
      MON_AXI_AWADDR(31),
      MON_AXI_AWADDR(30),
      MON_AXI_AWADDR(29),
      MON_AXI_AWADDR(28),
      MON_AXI_AWADDR(27),
      MON_AXI_AWADDR(26),
      MON_AXI_AWADDR(25),
      MON_AXI_AWADDR(24),
      MON_AXI_AWADDR(23),
      MON_AXI_AWADDR(22),
      MON_AXI_AWADDR(21),
      MON_AXI_AWADDR(20),
      MON_AXI_AWADDR(19),
      MON_AXI_AWADDR(18),
      MON_AXI_AWADDR(17),
      MON_AXI_AWADDR(16),
      MON_AXI_AWADDR(15),
      MON_AXI_AWADDR(14),
      MON_AXI_AWADDR(13),
      MON_AXI_AWADDR(12),
      MON_AXI_AWADDR(11),
      MON_AXI_AWADDR(10),
      MON_AXI_AWADDR(9),
      MON_AXI_AWADDR(8),
      MON_AXI_AWADDR(7),
      MON_AXI_AWADDR(6),
      MON_AXI_AWADDR(5),
      MON_AXI_AWADDR(4),
      MON_AXI_AWADDR(3),
      MON_AXI_AWADDR(2),
      MON_AXI_AWADDR(1),
      MON_AXI_AWADDR(0)
     );
  MON_AXI_RDATA_TRIG_SIGNAL <=
     (
      MON_AXI_RDATA(31),
      MON_AXI_RDATA(30),
      MON_AXI_RDATA(29),
      MON_AXI_RDATA(28),
      MON_AXI_RDATA(27),
      MON_AXI_RDATA(26),
      MON_AXI_RDATA(25),
      MON_AXI_RDATA(24),
      MON_AXI_RDATA(23),
      MON_AXI_RDATA(22),
      MON_AXI_RDATA(21),
      MON_AXI_RDATA(20),
      MON_AXI_RDATA(19),
      MON_AXI_RDATA(18),
      MON_AXI_RDATA(17),
      MON_AXI_RDATA(16),
      MON_AXI_RDATA(15),
      MON_AXI_RDATA(14),
      MON_AXI_RDATA(13),
      MON_AXI_RDATA(12),
      MON_AXI_RDATA(11),
      MON_AXI_RDATA(10),
      MON_AXI_RDATA(9),
      MON_AXI_RDATA(8),
      MON_AXI_RDATA(7),
      MON_AXI_RDATA(6),
      MON_AXI_RDATA(5),
      MON_AXI_RDATA(4),
      MON_AXI_RDATA(3),
      MON_AXI_RDATA(2),
      MON_AXI_RDATA(1),
      MON_AXI_RDATA(0)
     );

        
        
--Instantiate the PC if enabled
 


  -- instantiate ILA
  U_ILA : chipscope_axi_monitor_0
  port map(
    CLK => MON_AXI_ACLK,
    CONTROL => CHIPSCOPE_ICON_CONTROL,
    DATA => data_TRIG_SIGNAL,
    TRIG0 => MON_AXI_ARADDR_TRIG_SIGNAL,
    TRIG1 => MON_AXI_ARADDRCONTROL_TRIG_SIGNAL,
    TRIG2 => MON_AXI_AWADDR_TRIG_SIGNAL,
    TRIG3 => MON_AXI_AWADDRCONTROL_TRIG_SIGNAL,
    TRIG4 => MON_AXI_BRESP_TRIG_SIGNAL,
    TRIG5 => MON_AXI_GLOBAL_TRIG_SIGNAL,
    TRIG6 => MON_AXI_RDATA_TRIG_SIGNAL,
    TRIG7 => MON_AXI_RDATACONTROL_TRIG_SIGNAL,
    TRIG8 => MON_AXI_WDATA_TRIG_SIGNAL,
    TRIG9 => MON_AXI_WDATACONTROL_TRIG_SIGNAL,
    TRIG_OUT => MON_AXI_TRIG_OUT
  );

  
end architecture STRUCTURE;
