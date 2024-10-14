/*
(c) Copyright 2019-2022 Xilinx, Inc. All rights reserved.
(c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
This file contains confidential and proprietary information
of Xilinx, Inc. and is protected under U.S. and
international copyright and other intellectual property
laws.
DISCLAIMER
This disclaimer is not a license and does not grant any
rights to the materials distributed herewith. Except as
otherwise provided in a valid license issued to you by
Xilinx, and to the maximum extent permitted by applicable
law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
(2) Xilinx shall not be liable (whether in contract or tort,
including negligence, or under any other theory of
liability) for any loss or damage of any kind or nature
related to, arising under or in connection with these
materials, including for any direct, or any indirect,
special, incidental, or consequential loss or damage
(including loss of data, profits, goodwill, or any type of
loss or damage suffered as a result of any action brought
by a third party) even if such damage or loss was
reasonably foreseeable or Xilinx had been advised of the
possibility of the same.
CRITICAL APPLICATIONS
Xilinx proddcts are not designed or intended to be fail-
safe, or for use in any application requiring fail-safe
performance, such as life-support or safety devices or
systems, Class III medical devices, nuclear facilities,
applications related to the deployment of airbags, or any
other applications that could lead to death, personal
injury, or severe property or environmental damage
(individually and collectively, "Critical
Applications"). Customer assumes the sole risk and
liability of any use of Xilinx proddcts in Critical
Applications, subject only to applicable laws and
regulations governing limitations on proddct liability.
THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
PART OF THIS FILE AT ALL TIMES.

*/

// This module translates a simple register access interface to 
// generate a single AXI Lite master operation.
  
module axi_master #(
    parameter   AXI_ADDR_WIDTH = 32, 
    parameter   AXI_DATA_WIDTH = 32
) (
    input  wire                          m_axi_aclk     ,
    input  wire                          m_axi_aresetn  ,
                                         
    // Simple TG Interface...
    input  wire                          wr_req         , // pulse 
    input  wire                          rd_req         , // pulse 
    input  wire [AXI_ADDR_WIDTH-1:0]     addr           , // valid on wr/rd req pulse
    input  wire [AXI_DATA_WIDTH-1:0]     wdata          , // valid on wr/rd req pulse
    input  wire [AXI_DATA_WIDTH/8-1:0]   wstrb          , // valid on wr/rd req pulse
    output wire                          op_ack         , // pulse upon completion
    output reg  [AXI_DATA_WIDTH-1:0]     rdata          , // valid on op_ack pulse
    
    // AXI Master Interface...
    output reg  [AXI_ADDR_WIDTH-1:0]     m_axi_araddr   ,
    output reg                           m_axi_arvalid  ,
    input  wire                          m_axi_arready  ,
                        
    output reg  [AXI_ADDR_WIDTH-1:0]     m_axi_awaddr   ,
    output reg                           m_axi_awvalid  ,
    input  wire                          m_axi_awready  ,

    output reg                           m_axi_bready   ,
    input  wire [1:0]                    m_axi_bresp    ,
    input  wire                          m_axi_bvalid   ,

    output reg                           m_axi_rready   ,
    input  wire [AXI_DATA_WIDTH-1:0]     m_axi_rdata    ,
    input  wire [1:0]                    m_axi_rresp    ,
    input  wire                          m_axi_rvalid   ,

    output reg  [AXI_DATA_WIDTH-1:0]     m_axi_wdata    ,
    output reg  [AXI_DATA_WIDTH/8-1:0]   m_axi_wstrb    ,
    output reg                           m_axi_wvalid   ,
    input  wire                          m_axi_wready   
);
 
// -----------------------------------------------------------

reg wr_req_0;
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) begin
        wr_req_0 <= 'h0;
    end else begin
        wr_req_0 <= wr_req;
    end
end

reg rd_req_0;
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) begin
        rd_req_0 <= 'h0;
    end else begin
        rd_req_0 <= rd_req;
    end
end

// -----------------------------------------------------------

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) begin
        m_axi_wdata  <= 'h0;
        m_axi_wstrb  <= 'h0;
        m_axi_awaddr <= 'h0;
    end else if (wr_req) begin
        m_axi_wdata  <= wdata;
        m_axi_wstrb  <= wstrb;
        m_axi_awaddr <= addr;
    end
end

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) begin
        m_axi_araddr <= 'h0;
    end else if (rd_req) begin
        m_axi_araddr <= addr;
    end
end

// -----------------------------------------------------------

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn)
        m_axi_awvalid <= 'h0;
    else if (m_axi_awvalid && m_axi_awready)
        m_axi_awvalid <= 'h0;
    else if (wr_req_0)
        m_axi_awvalid <= 'h1;
end

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn)
        m_axi_wvalid <= 'h0;
    else if (m_axi_wvalid && m_axi_wready)
        m_axi_wvalid <= 'h0;
    else if (wr_req_0)
        m_axi_wvalid <= 'h1;
end

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn)
        m_axi_arvalid <= 'h0;
    else if (m_axi_arvalid && m_axi_arready)
        m_axi_arvalid <= 'h0;
    else if (rd_req_0)
        m_axi_arvalid <= 'h1;
end

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn)
        m_axi_rready <= 'h0;
    else if (m_axi_rvalid && m_axi_rready)
        m_axi_rready <= 'h0;
    else if (rd_req_0)
        m_axi_rready <= 'h1;
end

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn)
        m_axi_bready <= 'h0;
    else if (m_axi_bvalid && m_axi_bready)
        m_axi_bready <= 'h0;
    else if (wr_req_0)
        m_axi_bready <= 'h1;
end

// -----------------------------------------------------------

reg wr_ack_a; 
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        wr_ack_a <= 'h0;
    else if (wr_ack)
        wr_ack_a <= 'h0;
    else if (m_axi_awready && m_axi_awvalid) 
        wr_ack_a <= 'h1;
end

reg wr_ack_d; 
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        wr_ack_d <= 'h0;
    else if (wr_ack)
        wr_ack_d <= 'h0;
    else if (m_axi_wready && m_axi_wvalid) 
        wr_ack_d <= 'h1;
end

reg wr_ack_b; 
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        wr_ack_b <= 'h0;
    else if (wr_ack)
        wr_ack_b <= 'h0;
    else if (m_axi_bready && m_axi_bvalid) 
        wr_ack_b <= 'h1;
end

wire wr_ack = wr_ack_a & wr_ack_d & wr_ack_b;

reg rd_ack_a; 
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        rd_ack_a <= 'h0;
    else if (rd_ack)
        rd_ack_a <= 'h0;
    else if (m_axi_arready && m_axi_arvalid) 
        rd_ack_a <= 'h1;
end

reg rd_ack_d; 
always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        rd_ack_d <= 'h0;
    else if (rd_ack)
        rd_ack_d <= 'h0;
    else if (m_axi_rready && m_axi_rvalid) 
        rd_ack_d <= 'h1;
end

wire rd_ack = rd_ack_a & rd_ack_d;

assign op_ack = wr_ack | rd_ack;

// -----------------------------------------------------------

always@(posedge m_axi_aclk)
begin
    if (!m_axi_aresetn) 
        rdata <= 'h0;
    else if (m_axi_rready && m_axi_rvalid) 
        rdata <= m_axi_rdata;
end

endmodule

