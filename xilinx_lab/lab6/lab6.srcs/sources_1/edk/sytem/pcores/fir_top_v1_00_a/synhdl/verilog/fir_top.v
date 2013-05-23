// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2012.4
// Copyright (C) 2012 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
module fir_top (
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
interrupt,
aresetn,
aclk
);

parameter C_S_AXI_FIR_IO_ADDR_WIDTH = 32;
parameter C_S_AXI_FIR_IO_DATA_WIDTH = 32;
parameter RESET_ACTIVE_LOW = 1;

input [C_S_AXI_FIR_IO_ADDR_WIDTH - 1:0] s_axi_fir_io_AWADDR ;
input s_axi_fir_io_AWVALID ;
output s_axi_fir_io_AWREADY ;
input [C_S_AXI_FIR_IO_DATA_WIDTH - 1:0] s_axi_fir_io_WDATA ;
input [C_S_AXI_FIR_IO_DATA_WIDTH/8 - 1:0] s_axi_fir_io_WSTRB ;
input s_axi_fir_io_WVALID ;
output s_axi_fir_io_WREADY ;
output [2 - 1:0] s_axi_fir_io_BRESP ;
output s_axi_fir_io_BVALID ;
input s_axi_fir_io_BREADY ;
input [C_S_AXI_FIR_IO_ADDR_WIDTH - 1:0] s_axi_fir_io_ARADDR ;
input s_axi_fir_io_ARVALID ;
output s_axi_fir_io_ARREADY ;
output [C_S_AXI_FIR_IO_DATA_WIDTH - 1:0] s_axi_fir_io_RDATA ;
output [2 - 1:0] s_axi_fir_io_RRESP ;
output s_axi_fir_io_RVALID ;
input s_axi_fir_io_RREADY ;
output interrupt ;

input aresetn ;

input aclk ;


wire [C_S_AXI_FIR_IO_ADDR_WIDTH - 1:0] s_axi_fir_io_AWADDR;
wire s_axi_fir_io_AWVALID;
wire s_axi_fir_io_AWREADY;
wire [C_S_AXI_FIR_IO_DATA_WIDTH - 1:0] s_axi_fir_io_WDATA;
wire [C_S_AXI_FIR_IO_DATA_WIDTH/8 - 1:0] s_axi_fir_io_WSTRB;
wire s_axi_fir_io_WVALID;
wire s_axi_fir_io_WREADY;
wire [2 - 1:0] s_axi_fir_io_BRESP;
wire s_axi_fir_io_BVALID;
wire s_axi_fir_io_BREADY;
wire [C_S_AXI_FIR_IO_ADDR_WIDTH - 1:0] s_axi_fir_io_ARADDR;
wire s_axi_fir_io_ARVALID;
wire s_axi_fir_io_ARREADY;
wire [C_S_AXI_FIR_IO_DATA_WIDTH - 1:0] s_axi_fir_io_RDATA;
wire [2 - 1:0] s_axi_fir_io_RRESP;
wire s_axi_fir_io_RVALID;
wire s_axi_fir_io_RREADY;
wire interrupt;

wire aresetn;


wire [16 - 1:0] sig_fir_y;
wire sig_fir_y_ap_vld;
wire [16 - 1:0] sig_fir_x;
wire sig_fir_ap_start;
wire sig_fir_ap_ready;
wire sig_fir_ap_done;
wire sig_fir_ap_idle;

wire sig_fir_ap_rst;




fir fir_U(
    .y(sig_fir_y),
    .y_ap_vld(sig_fir_y_ap_vld),
    .x(sig_fir_x),
    .ap_start(sig_fir_ap_start),
    .ap_ready(sig_fir_ap_ready),
    .ap_done(sig_fir_ap_done),
    .ap_idle(sig_fir_ap_idle),
    .ap_rst(sig_fir_ap_rst),
    .ap_clk(aclk)
);

fir_io_if #(
    .C_ADDR_WIDTH(C_S_AXI_FIR_IO_ADDR_WIDTH),
    .C_DATA_WIDTH(C_S_AXI_FIR_IO_DATA_WIDTH))
fir_io_if_U(
    .ACLK(aclk),
    .ARESETN(aresetn),
    .O_y(sig_fir_y),
    .O_y_ap_vld(sig_fir_y_ap_vld),
    .I_x(sig_fir_x),
    .I_ap_start(sig_fir_ap_start),
    .O_ap_ready(sig_fir_ap_ready),
    .O_ap_done(sig_fir_ap_done),
    .O_ap_idle(sig_fir_ap_idle),
    .AWADDR(s_axi_fir_io_AWADDR),
    .AWVALID(s_axi_fir_io_AWVALID),
    .AWREADY(s_axi_fir_io_AWREADY),
    .WDATA(s_axi_fir_io_WDATA),
    .WSTRB(s_axi_fir_io_WSTRB),
    .WVALID(s_axi_fir_io_WVALID),
    .WREADY(s_axi_fir_io_WREADY),
    .BRESP(s_axi_fir_io_BRESP),
    .BVALID(s_axi_fir_io_BVALID),
    .BREADY(s_axi_fir_io_BREADY),
    .ARADDR(s_axi_fir_io_ARADDR),
    .ARVALID(s_axi_fir_io_ARVALID),
    .ARREADY(s_axi_fir_io_ARREADY),
    .RDATA(s_axi_fir_io_RDATA),
    .RRESP(s_axi_fir_io_RRESP),
    .RVALID(s_axi_fir_io_RVALID),
    .RREADY(s_axi_fir_io_RREADY),
    .interrupt(interrupt));

fir_ap_rst_if #(
    .RESET_ACTIVE_LOW(RESET_ACTIVE_LOW))
ap_rst_if_U(
    .dout(sig_fir_ap_rst),
    .din(aresetn));

endmodule
