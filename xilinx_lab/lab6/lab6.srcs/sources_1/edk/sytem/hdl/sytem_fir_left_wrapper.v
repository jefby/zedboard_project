//-----------------------------------------------------------------------------
// sytem_fir_left_wrapper.v
//-----------------------------------------------------------------------------

module sytem_fir_left_wrapper
  (
    aclk,
    aresetn,
    s_axi_fir_io_AWADDR,
    s_axi_fir_io_AWVALID,
    s_axi_fir_io_AWREADY,
    s_axi_fir_io_WDATA,
    s_axi_fir_io_WSTRB,
    s_axi_fir_io_WVALID,
    s_axi_fir_io_WREADY,
    s_axi_fir_io_BRESP,
    s_axi_fir_io_BVALID,
    s_axi_fir_io_BREADY,
    s_axi_fir_io_ARADDR,
    s_axi_fir_io_ARVALID,
    s_axi_fir_io_ARREADY,
    s_axi_fir_io_RDATA,
    s_axi_fir_io_RRESP,
    s_axi_fir_io_RVALID,
    s_axi_fir_io_RREADY,
    interrupt
  );
  input aclk;
  input aresetn;
  input [31:0] s_axi_fir_io_AWADDR;
  input s_axi_fir_io_AWVALID;
  output s_axi_fir_io_AWREADY;
  input [31:0] s_axi_fir_io_WDATA;
  input [3:0] s_axi_fir_io_WSTRB;
  input s_axi_fir_io_WVALID;
  output s_axi_fir_io_WREADY;
  output [1:0] s_axi_fir_io_BRESP;
  output s_axi_fir_io_BVALID;
  input s_axi_fir_io_BREADY;
  input [31:0] s_axi_fir_io_ARADDR;
  input s_axi_fir_io_ARVALID;
  output s_axi_fir_io_ARREADY;
  output [31:0] s_axi_fir_io_RDATA;
  output [1:0] s_axi_fir_io_RRESP;
  output s_axi_fir_io_RVALID;
  input s_axi_fir_io_RREADY;
  output interrupt;

  fir_top
    #(
      .C_S_AXI_FIR_IO_ADDR_WIDTH ( 32 ),
      .C_S_AXI_FIR_IO_DATA_WIDTH ( 32 )
    )
    fir_left (
      .aclk ( aclk ),
      .aresetn ( aresetn ),
      .s_axi_fir_io_AWADDR ( s_axi_fir_io_AWADDR ),
      .s_axi_fir_io_AWVALID ( s_axi_fir_io_AWVALID ),
      .s_axi_fir_io_AWREADY ( s_axi_fir_io_AWREADY ),
      .s_axi_fir_io_WDATA ( s_axi_fir_io_WDATA ),
      .s_axi_fir_io_WSTRB ( s_axi_fir_io_WSTRB ),
      .s_axi_fir_io_WVALID ( s_axi_fir_io_WVALID ),
      .s_axi_fir_io_WREADY ( s_axi_fir_io_WREADY ),
      .s_axi_fir_io_BRESP ( s_axi_fir_io_BRESP ),
      .s_axi_fir_io_BVALID ( s_axi_fir_io_BVALID ),
      .s_axi_fir_io_BREADY ( s_axi_fir_io_BREADY ),
      .s_axi_fir_io_ARADDR ( s_axi_fir_io_ARADDR ),
      .s_axi_fir_io_ARVALID ( s_axi_fir_io_ARVALID ),
      .s_axi_fir_io_ARREADY ( s_axi_fir_io_ARREADY ),
      .s_axi_fir_io_RDATA ( s_axi_fir_io_RDATA ),
      .s_axi_fir_io_RRESP ( s_axi_fir_io_RRESP ),
      .s_axi_fir_io_RVALID ( s_axi_fir_io_RVALID ),
      .s_axi_fir_io_RREADY ( s_axi_fir_io_RREADY ),
      .interrupt ( interrupt )
    );

endmodule

