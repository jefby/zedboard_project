//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
  (
    processing_system7_0_MIO,
    processing_system7_0_PS_SRSTB_pin,
    processing_system7_0_PS_CLK_pin,
    processing_system7_0_PS_PORB_pin,
    processing_system7_0_DDR_Clk,
    processing_system7_0_DDR_Clk_n,
    processing_system7_0_DDR_CKE,
    processing_system7_0_DDR_CS_n,
    processing_system7_0_DDR_RAS_n,
    processing_system7_0_DDR_CAS_n,
    processing_system7_0_DDR_WEB_pin,
    processing_system7_0_DDR_BankAddr,
    processing_system7_0_DDR_Addr,
    processing_system7_0_DDR_ODT,
    processing_system7_0_DDR_DRSTB,
    processing_system7_0_DDR_DQ,
    processing_system7_0_DDR_DM,
    processing_system7_0_DDR_DQS,
    processing_system7_0_DDR_DQS_n,
    processing_system7_0_DDR_VRN,
    processing_system7_0_DDR_VRP,
    i2s_addr,
    hdmi_clk,
    hdmi_vsync,
    hdmi_hsync,
    hdmi_data_e,
    hdmi_data,
    i2s_bclk,
    i2s_lrclk,
    i2s_sdata_I,
    i2s_sdata_O,
    hdmi_int,
    hdmi_iic_sda,
    hdmi_iic_scl,
    i2s_iic_sda,
    i2s_iic_scl,
    hdmi_spdif,
    i2s_mclk,
    otg_oc,
    processing_system7_0_GPIO
  );
  inout [53:0] processing_system7_0_MIO;
  input processing_system7_0_PS_SRSTB_pin;
  input processing_system7_0_PS_CLK_pin;
  input processing_system7_0_PS_PORB_pin;
  inout processing_system7_0_DDR_Clk;
  inout processing_system7_0_DDR_Clk_n;
  inout processing_system7_0_DDR_CKE;
  inout processing_system7_0_DDR_CS_n;
  inout processing_system7_0_DDR_RAS_n;
  inout processing_system7_0_DDR_CAS_n;
  output processing_system7_0_DDR_WEB_pin;
  inout [2:0] processing_system7_0_DDR_BankAddr;
  inout [14:0] processing_system7_0_DDR_Addr;
  inout processing_system7_0_DDR_ODT;
  inout processing_system7_0_DDR_DRSTB;
  inout [31:0] processing_system7_0_DDR_DQ;
  inout [3:0] processing_system7_0_DDR_DM;
  inout [3:0] processing_system7_0_DDR_DQS;
  inout [3:0] processing_system7_0_DDR_DQS_n;
  inout processing_system7_0_DDR_VRN;
  inout processing_system7_0_DDR_VRP;
  inout [1:0] i2s_addr;
  output hdmi_clk;
  output hdmi_vsync;
  output hdmi_hsync;
  output hdmi_data_e;
  output [15:0] hdmi_data;
  output i2s_bclk;
  output i2s_lrclk;
  input i2s_sdata_I;
  output i2s_sdata_O;
  input hdmi_int;
  inout hdmi_iic_sda;
  inout hdmi_iic_scl;
  inout i2s_iic_sda;
  inout i2s_iic_scl;
  output hdmi_spdif;
  output i2s_mclk;
  input otg_oc;
  inout [59:0] processing_system7_0_GPIO;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .processing_system7_0_MIO ( processing_system7_0_MIO ),
      .processing_system7_0_PS_SRSTB_pin ( processing_system7_0_PS_SRSTB_pin ),
      .processing_system7_0_PS_CLK_pin ( processing_system7_0_PS_CLK_pin ),
      .processing_system7_0_PS_PORB_pin ( processing_system7_0_PS_PORB_pin ),
      .processing_system7_0_DDR_Clk ( processing_system7_0_DDR_Clk ),
      .processing_system7_0_DDR_Clk_n ( processing_system7_0_DDR_Clk_n ),
      .processing_system7_0_DDR_CKE ( processing_system7_0_DDR_CKE ),
      .processing_system7_0_DDR_CS_n ( processing_system7_0_DDR_CS_n ),
      .processing_system7_0_DDR_RAS_n ( processing_system7_0_DDR_RAS_n ),
      .processing_system7_0_DDR_CAS_n ( processing_system7_0_DDR_CAS_n ),
      .processing_system7_0_DDR_WEB_pin ( processing_system7_0_DDR_WEB_pin ),
      .processing_system7_0_DDR_BankAddr ( processing_system7_0_DDR_BankAddr ),
      .processing_system7_0_DDR_Addr ( processing_system7_0_DDR_Addr ),
      .processing_system7_0_DDR_ODT ( processing_system7_0_DDR_ODT ),
      .processing_system7_0_DDR_DRSTB ( processing_system7_0_DDR_DRSTB ),
      .processing_system7_0_DDR_DQ ( processing_system7_0_DDR_DQ ),
      .processing_system7_0_DDR_DM ( processing_system7_0_DDR_DM ),
      .processing_system7_0_DDR_DQS ( processing_system7_0_DDR_DQS ),
      .processing_system7_0_DDR_DQS_n ( processing_system7_0_DDR_DQS_n ),
      .processing_system7_0_DDR_VRN ( processing_system7_0_DDR_VRN ),
      .processing_system7_0_DDR_VRP ( processing_system7_0_DDR_VRP ),
      .i2s_addr ( i2s_addr ),
      .hdmi_clk ( hdmi_clk ),
      .hdmi_vsync ( hdmi_vsync ),
      .hdmi_hsync ( hdmi_hsync ),
      .hdmi_data_e ( hdmi_data_e ),
      .hdmi_data ( hdmi_data ),
      .i2s_bclk ( i2s_bclk ),
      .i2s_lrclk ( i2s_lrclk ),
      .i2s_sdata_I ( i2s_sdata_I ),
      .i2s_sdata_O ( i2s_sdata_O ),
      .hdmi_int ( hdmi_int ),
      .hdmi_iic_sda ( hdmi_iic_sda ),
      .hdmi_iic_scl ( hdmi_iic_scl ),
      .i2s_iic_sda ( i2s_iic_sda ),
      .i2s_iic_scl ( i2s_iic_scl ),
      .hdmi_spdif ( hdmi_spdif ),
      .i2s_mclk ( i2s_mclk ),
      .otg_oc ( otg_oc ),
      .processing_system7_0_GPIO ( processing_system7_0_GPIO )
    );

endmodule

module system
  (
    processing_system7_0_MIO,
    processing_system7_0_PS_SRSTB_pin,
    processing_system7_0_PS_CLK_pin,
    processing_system7_0_PS_PORB_pin,
    processing_system7_0_DDR_Clk,
    processing_system7_0_DDR_Clk_n,
    processing_system7_0_DDR_CKE,
    processing_system7_0_DDR_CS_n,
    processing_system7_0_DDR_RAS_n,
    processing_system7_0_DDR_CAS_n,
    processing_system7_0_DDR_WEB_pin,
    processing_system7_0_DDR_BankAddr,
    processing_system7_0_DDR_Addr,
    processing_system7_0_DDR_ODT,
    processing_system7_0_DDR_DRSTB,
    processing_system7_0_DDR_DQ,
    processing_system7_0_DDR_DM,
    processing_system7_0_DDR_DQS,
    processing_system7_0_DDR_DQS_n,
    processing_system7_0_DDR_VRN,
    processing_system7_0_DDR_VRP,
    i2s_addr,
    hdmi_clk,
    hdmi_vsync,
    hdmi_hsync,
    hdmi_data_e,
    hdmi_data,
    i2s_bclk,
    i2s_lrclk,
    i2s_sdata_I,
    i2s_sdata_O,
    hdmi_int,
    hdmi_iic_sda,
    hdmi_iic_scl,
    i2s_iic_sda,
    i2s_iic_scl,
    hdmi_spdif,
    i2s_mclk,
    otg_oc,
    processing_system7_0_GPIO
  );
  inout [53:0] processing_system7_0_MIO;
  input processing_system7_0_PS_SRSTB_pin;
  input processing_system7_0_PS_CLK_pin;
  input processing_system7_0_PS_PORB_pin;
  inout processing_system7_0_DDR_Clk;
  inout processing_system7_0_DDR_Clk_n;
  inout processing_system7_0_DDR_CKE;
  inout processing_system7_0_DDR_CS_n;
  inout processing_system7_0_DDR_RAS_n;
  inout processing_system7_0_DDR_CAS_n;
  output processing_system7_0_DDR_WEB_pin;
  inout [2:0] processing_system7_0_DDR_BankAddr;
  inout [14:0] processing_system7_0_DDR_Addr;
  inout processing_system7_0_DDR_ODT;
  inout processing_system7_0_DDR_DRSTB;
  inout [31:0] processing_system7_0_DDR_DQ;
  inout [3:0] processing_system7_0_DDR_DM;
  inout [3:0] processing_system7_0_DDR_DQS;
  inout [3:0] processing_system7_0_DDR_DQS_n;
  inout processing_system7_0_DDR_VRN;
  inout processing_system7_0_DDR_VRP;
  inout [1:0] i2s_addr;
  output hdmi_clk;
  output hdmi_vsync;
  output hdmi_hsync;
  output hdmi_data_e;
  output [15:0] hdmi_data;
  output i2s_bclk;
  output i2s_lrclk;
  input i2s_sdata_I;
  output i2s_sdata_O;
  input hdmi_int;
  inout hdmi_iic_sda;
  inout hdmi_iic_scl;
  inout i2s_iic_sda;
  inout i2s_iic_scl;
  output hdmi_spdif;
  output i2s_mclk;
  input otg_oc;
  inout [59:0] processing_system7_0_GPIO;
endmodule

