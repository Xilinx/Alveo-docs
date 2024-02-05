/*
Copyright (c) 2023, Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: MIT
*/

localparam RXCDR_CFG2 = 'd617;
localparam RXPHBEACON_RAW_CFG = 'd5;
localparam RXPHSAMP_CFG = 'd25056;
localparam RX_CM_TRIM = 'd10;
localparam RX_PMA_RSV0 = 'd15;
localparam TCO_NEW_CFG0 = 'd4480;
localparam TXFE_CFG0 = 'd33730;
localparam TXPHDLY_CFG0 = 'd58608;
localparam TXPHDLY_CFG1 = 'd25;
localparam TXMAINCURSOR = 'd90;

localparam SIM_RESET_SPEEDUP = "TRUE";
localparam ACJTAG_DEBUG_MODE = 'd0;
localparam ACJTAG_MODE = 'd0;
localparam ACJTAG_RESET = 'd0;
localparam ADAPT_CFG0 = 'd0;
localparam ADAPT_CFG1 = 'd64284;
localparam ADAPT_CFG2 = 'd0;
localparam AEN_QPLL0_FBDIV = 'd1;
localparam AEN_QPLL1_FBDIV = 'd1;
localparam AEN_SDM0TOGGLE = 'd0;
localparam AEN_SDM1TOGGLE = 'd0;
localparam A_RXOSCALRESET = 'd0;
localparam A_RXPROGDIVRESET = 'd0;
localparam A_RXTERMINATION = 'd1;
localparam A_SDM0TOGGLE = 'd0;
localparam A_SDM1DATA_HIGH = 'd0;
localparam A_SDM1DATA_LOW = 'd0;
localparam A_SDM1TOGGLE = 'd0;
localparam A_TXPROGDIVRESET = 'd0;
localparam BIAS_CFG0 = 'd0;
localparam BIAS_CFG1 = 'd0;
localparam BIAS_CFG2 = 'd1316;
localparam BIAS_CFG3 = 'd65;
localparam BIAS_CFG4 = 'd16;
localparam BIAS_CFG_RSVD = 'd0;
localparam CDR_SWAP_MODE_EN = 'd0;
localparam CFOK_PWRSVE_EN = 'd1;
localparam CH_HSPMUX = 'd16448;
localparam CKCAL1_CFG_0 = 'd49344;
localparam CKCAL1_CFG_1 = 'd4288;
localparam CKCAL1_CFG_2 = 'd8200;
localparam CKCAL1_CFG_3 = 'd0;
localparam CKCAL2_CFG_0 = 'd49344;
localparam CKCAL2_CFG_1 = 'd32960;
localparam CKCAL2_CFG_2 = 'd4096;
localparam CKCAL2_CFG_3 = 'd0;
localparam CKCAL2_CFG_4 = 'd0;
localparam COMMON_CFG0 = 'd0;
localparam COMMON_CFG1 = 'd0;
localparam CPLL_CFG0 = 'd506;
localparam CPLL_CFG1 = 'd43;
localparam CPLL_CFG2 = 'd2;
localparam CPLL_CFG3 = 'd0;
localparam CPLL_FBDIV = 'd2;
localparam CPLL_FBDIV_45 = 'd5;
localparam CPLL_INIT_CFG0 = 'd690;
localparam CPLL_LOCK_CFG = 'd488;
localparam CPLL_REFCLK_DIV = 'd1;
localparam CTLE3_OCAP_EXT_CTRL = 'd0;
localparam CTLE3_OCAP_EXT_EN = 'd0;
localparam DMONITOR_CFG0 = 'd0;
localparam DMONITOR_CFG1 = 'd0;
localparam ES_CLK_PHASE_SEL = 'd0;
localparam ES_CONTROL = 'd0;
localparam ES_ERRDET_EN = "FALSE";
localparam ES_EYE_SCAN_EN = "FALSE";
localparam ES_HORZ_OFFSET = 'd0;
localparam ES_PRESCALE = 'd0;
localparam ES_QUALIFIER0 = 'd0;
localparam ES_QUALIFIER1 = 'd0;
localparam ES_QUALIFIER2 = 'd0;
localparam ES_QUALIFIER3 = 'd0;
localparam ES_QUALIFIER4 = 'd0;
localparam ES_QUALIFIER5 = 'd0;
localparam ES_QUALIFIER6 = 'd0;
localparam ES_QUALIFIER7 = 'd0;
localparam ES_QUALIFIER8 = 'd0;
localparam ES_QUALIFIER9 = 'd0;
localparam ES_QUAL_MASK0 = 'd0;
localparam ES_QUAL_MASK1 = 'd0;
localparam ES_QUAL_MASK2 = 'd0;
localparam ES_QUAL_MASK3 = 'd0;
localparam ES_QUAL_MASK4 = 'd0;
localparam ES_QUAL_MASK5 = 'd0;
localparam ES_QUAL_MASK6 = 'd0;
localparam ES_QUAL_MASK7 = 'd0;
localparam ES_QUAL_MASK8 = 'd0;
localparam ES_QUAL_MASK9 = 'd0;
localparam ES_SDATA_MASK0 = 'd0;
localparam ES_SDATA_MASK1 = 'd0;
localparam ES_SDATA_MASK2 = 'd0;
localparam ES_SDATA_MASK3 = 'd0;
localparam ES_SDATA_MASK4 = 'd0;
localparam ES_SDATA_MASK5 = 'd0;
localparam ES_SDATA_MASK6 = 'd0;
localparam ES_SDATA_MASK7 = 'd0;
localparam ES_SDATA_MASK8 = 'd0;
localparam ES_SDATA_MASK9 = 'd0;
localparam EYESCAN_VP_RANGE = 'd0;
localparam EYE_SCAN_SWAP_EN = 'd0;
localparam ISCAN_CK_PH_SEL2 = 'd0;
localparam LOCAL_MASTER = 'd1;
localparam LPBK_BIAS_CTRL = 'd4;
localparam LPBK_EN_RCAL_B = 'd0;
localparam LPBK_EXT_RCAL = 'd8;
localparam LPBK_IND_CTRL0 = 'd5;
localparam LPBK_IND_CTRL1 = 'd5;
localparam LPBK_IND_CTRL2 = 'd5;
localparam LPBK_RG_CTRL = 'd2;
localparam MAC_CFG0 = 'd0;
localparam MAC_CFG1 = 'd0;
localparam MAC_CFG10 = 'd199;
localparam MAC_CFG11 = 'd64;
localparam MAC_CFG12 = 'd9600;
localparam MAC_CFG13 = 'd1;
localparam MAC_CFG14 = 'd0;
localparam MAC_CFG15 = 'd0;
localparam MAC_CFG2 = 'd0;
localparam MAC_CFG3 = 'd0;
localparam MAC_CFG4 = 'd0;
localparam MAC_CFG5 = 'd0;
localparam MAC_CFG6 = 'd0;
localparam MAC_CFG7 = 'd0;
localparam MAC_CFG8 = 'd0;
localparam MAC_CFG9 = 'd3077;
localparam PCS_RSVD0 = 'd1;
localparam PD_TRANS_TIME_FROM_P2 = 'd60;
localparam PD_TRANS_TIME_NONE_P2 = 'd25;
localparam PD_TRANS_TIME_TO_P2 = 'd100;
localparam POR_CFG = 'd0;
localparam PPF0_CFG = 'd1536;
localparam PPF1_CFG = 'd1536;
localparam PREIQ_FREQ_BST = 'd1;
localparam QPLL0CLKOUT_RATE = "HALF";
localparam QPLL0_CFG0 = 'd13084;
localparam QPLL0_CFG1 = 'd53304;
localparam QPLL0_CFG1_G3 = 'd53304;
localparam QPLL0_CFG2 = 'd4032;
localparam QPLL0_CFG2_G3 = 'd4032;
localparam QPLL0_CFG3 = 'd288;
localparam QPLL0_CFG4 = 'd2;
localparam QPLL0_CP = 'd255;
localparam QPLL0_CP_G3 = 'd15;
localparam QPLL0_FBDIV = 'd64;
localparam QPLL0_FBDIV_G3 = 'd160;
localparam QPLL0_INIT_CFG0 = 'd690;
localparam QPLL0_INIT_CFG1 = 'd0;
localparam QPLL0_LOCK_CFG = 'd9704;
localparam QPLL0_LOCK_CFG_G3 = 'd9704;
localparam QPLL0_LPF = 'd575;
localparam QPLL0_LPF_G3 = 'd469;
localparam QPLL0_PCI_EN = 'd0;
localparam QPLL0_RATE_SW_USE_DRP = 'd1;
localparam QPLL0_REFCLK_DIV = 'd1;
localparam QPLL0_SDM_CFG0 = 'd128;
localparam QPLL0_SDM_CFG1 = 'd0;
localparam QPLL0_SDM_CFG2 = 'd0;
localparam QPLL1CLKOUT_RATE = "HALF";
localparam QPLL1_CFG0 = 'd13084;
localparam QPLL1_CFG1 = 'd53304;
localparam QPLL1_CFG1_G3 = 'd53304;
localparam QPLL1_CFG2 = 'd4035;
localparam QPLL1_CFG2_G3 = 'd4035;
localparam QPLL1_CFG3 = 'd288;
localparam QPLL1_CFG4 = 'd2;
localparam QPLL1_CP = 'd255;
localparam QPLL1_CP_G3 = 'd127;
localparam QPLL1_FBDIV = 'd66;
localparam QPLL1_FBDIV_G3 = 'd80;
localparam QPLL1_INIT_CFG0 = 'd690;
localparam QPLL1_INIT_CFG1 = 'd0;
localparam QPLL1_LOCK_CFG = 'd9704;
localparam QPLL1_LOCK_CFG_G3 = 'd9704;
localparam QPLL1_LPF = 'd543;
localparam QPLL1_LPF_G3 = 'd468;
localparam QPLL1_PCI_EN = 'd0;
localparam QPLL1_RATE_SW_USE_DRP = 'd1;
localparam QPLL1_REFCLK_DIV = 'd1;
localparam QPLL1_SDM_CFG0 = 'd128;
localparam QPLL1_SDM_CFG1 = 'd0;
localparam QPLL1_SDM_CFG2 = 'd0;
localparam RAW_MAC_CFG = 'd17;
localparam RCLK_SIPO_DLY_ENB = 'd0;
localparam RCLK_SIPO_INV_EN = 'd0;
localparam RCO_NEW_MAC_CFG0 = 'd160;
localparam RCO_NEW_MAC_CFG1 = 'd0;
localparam RCO_NEW_MAC_CFG2 = 'd1872;
localparam RCO_NEW_MAC_CFG3 = 'd0;
localparam RCO_NEW_RAW_CFG0 = 'd136;
localparam RCO_NEW_RAW_CFG1 = 'd8224;
localparam RCO_NEW_RAW_CFG2 = 'd1872;
localparam RCO_NEW_RAW_CFG3 = 'd0;
localparam RSVD_ATTR0 = 'd0;
localparam RSVD_ATTR1 = 'd0;
localparam RSVD_ATTR2 = 'd0;
localparam RSVD_ATTR3 = 'd0;
localparam RTX_BUF_CML_CTRL = 'd3;
localparam RTX_BUF_TERM_CTRL = 'd0;
localparam RXBUF_EN = "FALSE";
localparam RXCDRFREQRESET_TIME = 'd1;
localparam RXCDRPHRESET_TIME = 'd1;
localparam RXCDR_CFG0 = 'd3;
localparam RXCDR_CFG1 = 'd0;
localparam RXCDR_CFG3 = 'd18;
localparam RXCDR_CFG4 = 'd23798;
localparam RXCDR_CFG5 = 'd46187;
localparam RXCDR_FR_RESET_ON_EIDLE = 'd0;
localparam RXCDR_HOLD_DURING_EIDLE = 'd0;
localparam RXCDR_LOCK_CFG0 = 'd8705;
localparam RXCDR_LOCK_CFG1 = 'd40959;
localparam RXCDR_LOCK_CFG2 = 'd0;
localparam RXCDR_LOCK_CFG3 = 'd0;
localparam RXCDR_LOCK_CFG4 = 'd0;
localparam RXCFOK_CFG0 = 'd0;
localparam RXCFOK_CFG1 = 'd32789;
localparam RXCFOK_CFG2 = 'd686;
localparam RXCKCAL1_IQ_LOOP_RST_CFG = 'd0;
localparam RXCKCAL1_I_LOOP_RST_CFG = 'd0;
localparam RXCKCAL1_Q_LOOP_RST_CFG = 'd0;
localparam RXCKCAL2_DX_LOOP_RST_CFG = 'd0;
localparam RXCKCAL2_D_LOOP_RST_CFG = 'd0;
localparam RXCKCAL2_S_LOOP_RST_CFG = 'd0;
localparam RXCKCAL2_X_LOOP_RST_CFG = 'd0;
localparam RXDFELPMRESET_TIME = 'd15;
localparam RXDFELPM_KL_CFG0 = 'd0;
localparam RXDFELPM_KL_CFG1 = 'd41090;
localparam RXDFELPM_KL_CFG2 = 'd256;
localparam RXDFE_CFG0 = 'd2560;
localparam RXDFE_CFG1 = 'd0;
localparam RXDFE_GC_CFG0 = 'd0;
localparam RXDFE_GC_CFG1 = 'd32768;
localparam RXDFE_GC_CFG2 = 'd65504;
localparam RXDFE_H2_CFG0 = 'd0;
localparam RXDFE_H2_CFG1 = 'd2;
localparam RXDFE_H3_CFG0 = 'd0;
localparam RXDFE_H3_CFG1 = 'd32770;
localparam RXDFE_H4_CFG0 = 'd0;
localparam RXDFE_H4_CFG1 = 'd32770;
localparam RXDFE_H5_CFG0 = 'd0;
localparam RXDFE_H5_CFG1 = 'd32770;
localparam RXDFE_H6_CFG0 = 'd0;
localparam RXDFE_H6_CFG1 = 'd32770;
localparam RXDFE_H7_CFG0 = 'd0;
localparam RXDFE_H7_CFG1 = 'd32770;
localparam RXDFE_H8_CFG0 = 'd0;
localparam RXDFE_H8_CFG1 = 'd32770;
localparam RXDFE_H9_CFG0 = 'd0;
localparam RXDFE_H9_CFG1 = 'd32770;
localparam RXDFE_HA_CFG0 = 'd0;
localparam RXDFE_HA_CFG1 = 'd32770;
localparam RXDFE_HB_CFG0 = 'd0;
localparam RXDFE_HB_CFG1 = 'd32770;
localparam RXDFE_HC_CFG0 = 'd0;
localparam RXDFE_HC_CFG1 = 'd32770;
localparam RXDFE_HD_CFG0 = 'd0;
localparam RXDFE_HD_CFG1 = 'd32770;
localparam RXDFE_HE_CFG0 = 'd0;
localparam RXDFE_HE_CFG1 = 'd32770;
localparam RXDFE_HF_CFG0 = 'd0;
localparam RXDFE_HF_CFG1 = 'd32770;
localparam RXDFE_KH_CFG0 = 'd32768;
localparam RXDFE_KH_CFG1 = 'd65024;
localparam RXDFE_KH_CFG2 = 'd512;
localparam RXDFE_KH_CFG3 = 'd16641;
localparam RXDFE_OS_CFG0 = 'd8192;
localparam RXDFE_OS_CFG1 = 'd32768;
localparam RXDFE_UT_CFG0 = 'd0;
localparam RXDFE_UT_CFG1 = 'd3;
localparam RXDFE_UT_CFG2 = 'd0;
localparam RXDFE_VP_CFG0 = 'd0;
localparam RXDFE_VP_CFG1 = 'd51;
localparam RXDLY_CFG = 'd16;
localparam RXDLY_LCFG = 'd48;
localparam RXDLY_RAW_CFG = 'd31;
localparam RXDLY_RAW_LCFG = 'd0;
localparam RXELECIDLE_CFG = "SIGCFG_4";
localparam RXISCANRESET_TIME = 'd1;
localparam RXLPM_CFG = 'd0;
localparam RXLPM_GC_CFG = 'd63488;
localparam RXLPM_KH_CFG0 = 'd0;
localparam RXLPM_KH_CFG1 = 'd40962;
localparam RXLPM_OS_CFG0 = 'd0;
localparam RXLPM_OS_CFG1 = 'd32770;
localparam RXOSCALRESET_TIME = 'd3;
localparam RXOUT_DIV = 'd1;
localparam RXPCSRESET_TIME = 'd3;
localparam RXPHBEACON_CFG = 'd0;
localparam RXPHDLY_CFG = 'd8224;
localparam RXPHSAMP_RAW_CFG = 'd57828;
localparam RXPHSLIP_CFG = 'd39219;
localparam RXPHSLIP_RAW_CFG = 'd39219;
localparam RXPH_MONITOR_SEL = 'd0;
localparam RXPI_CFG0 = 'd258;
localparam RXPI_CFG1 = 'd84;
localparam RXPMACLK_SEL = "DATA";
localparam RXPMARESET_TIME = 'd3;
localparam RXPRBS_ERR_LOOPBACK = 'd0;
localparam RXPRBS_LINKACQ_CNT = 'd15;
localparam RXRECCLKOUT0_SEL = 'd0;
localparam RXRECCLKOUT1_SEL = 'd0;
localparam RXREFCLKDIV2_SEL = 'd0;
localparam RXSLIDE_AUTO_WAIT = 'd7;
localparam RXSLIDE_MODE = "OFF";
localparam RXSYNC_MULTILANE = 'd0;
localparam RXSYNC_OVRD = 'd0;
localparam RXSYNC_SKIP_DA = 'd0;
localparam RX_AFE_CM_EN = 'd0;
localparam RX_BIAS_CFG0 = 'd4784;
localparam RX_CAPFF_SARC_ENB = 'd0;
localparam RX_CLK25_DIV = 'd7;
localparam RX_CLKMUX_EN = 'd1;
localparam RX_CLK_SLIP_OVRD = 'd0;
localparam RX_CM_BUF_CFG = 'd10;
localparam RX_CM_BUF_PD = 'd0;
localparam RX_CM_SEL = 'd3;
localparam RX_CTLE_PWR_SAVING = 'd0;
localparam RX_CTLE_RES_CTRL = 'd0;
localparam RX_DATA_WIDTH = 'd32;
localparam RX_DEGEN_CTRL = 'd7;
localparam RX_DFELPM_CFG0 = 'd10;
localparam RX_DFELPM_CFG1 = 'd1;
localparam RX_DFELPM_KLKH_AGC_STUP_EN = 'd1;
localparam RX_DFE_AGC_CFG1 = 'd4;
localparam RX_DFE_KL_LPM_KH_CFG0 = 'd3;
localparam RX_DFE_KL_LPM_KH_CFG1 = 'd2;
localparam RX_DFE_KL_LPM_KL_CFG0 = 'd3;
localparam RX_DFE_KL_LPM_KL_CFG1 = 'd2;
localparam RX_DFE_LPM_HOLD_DURING_EIDLE = 'd0;
localparam RX_DIVRESET_TIME = 'd1;
localparam RX_EN_CTLE_RCAL_B = 'd0;
localparam RX_EN_SUM_RCAL_B = 'd0;
localparam RX_EYESCAN_VS_CODE = 'd0;
localparam RX_EYESCAN_VS_NEG_DIR = 'd0;
localparam RX_EYESCAN_VS_RANGE = 'd2;
localparam RX_EYESCAN_VS_UT_SIGN = 'd0;
localparam RX_I2V_FILTER_EN = 'd1;
localparam RX_INT_DATAWIDTH = 'd1;
localparam RX_OUTCLK_BUFG_GT_DIV = 'd1;
localparam RX_PMA_POWER_SAVE = 'd0;
localparam real RX_PROGDIV_CFG = 8.0;
localparam RX_PROGDIV_RATE = 'd1;
localparam RX_SIG_VALID_DLY = 'd11;
localparam RX_SUM_DEGEN_AVTT_OVERITE = 'd1;
localparam RX_SUM_DFETAPREP_EN = 'd0;
localparam RX_SUM_IREF_TUNE = 'd0;
localparam RX_SUM_PWR_SAVING = 'd0;
localparam RX_SUM_RES_CTRL = 'd0;
localparam RX_SUM_VCMTUNE = 'd9;
localparam RX_SUM_VCM_BIAS_TUNE_EN = 'd1;
localparam RX_SUM_VCM_OVWR = 'd0;
localparam RX_SUM_VREF_TUNE = 'd4;
localparam RX_TUNE_AFE_OS = 'd2;
localparam RX_VREG_CTRL = 'd2;
localparam RX_VREG_PDB = 'd1;
localparam RX_WIDEMODE_CDR = 'd1;
localparam RX_XCLK_SEL = "RXUSR";
localparam RX_XMODE_SEL = 'd1;
localparam SAMPLE_CLK_PHASE = 'd0;
localparam SARC_ENB = 'd0;
localparam SARC_SEL = 'd0;
localparam SDM0INITSEED0_0 = 'd273;
localparam SDM0INITSEED0_1 = 'd17;
localparam SDM1INITSEED0_0 = 'd273;
localparam SDM1INITSEED0_1 = 'd17;
localparam SIM_MODE = "FAST";
localparam SIM_TX_EIDLE_DRIVE_LEVEL = "Z";
localparam SRSTMODE = 'd0;
localparam TAPDLY_SET_TX = 'd0;
localparam TCO_NEW_CFG1 = 'd50425;
localparam TCO_NEW_CFG2 = 'd0;
localparam TCO_NEW_CFG3 = 'd0;
localparam TCO_RSVD1 = 'd0;
localparam TCO_RSVD2 = 'd0;
localparam TERM_RCAL_CFG = 'd16898;
localparam TERM_RCAL_OVRD = 'd1;
localparam TRANS_TIME_RATE = 'd14;
localparam TST_RSV0 = 'd0;
localparam TST_RSV1 = 'd0;
localparam TXBUF_EN = "FALSE";
localparam TXDLY_CFG = 'd35652;
localparam TXDLY_LCFG = 'd64;
localparam TXDRV_FREQBAND = 'd0;
localparam TXFE_CFG1 = 'd27648;
localparam TXFE_CFG2 = 'd27648;
localparam TXFE_CFG3 = 'd27648;
localparam TXFIFO_ADDR_CFG = "LOW";
localparam TXOUT_DIV = 'd1;
localparam TXPCSRESET_TIME = 'd3;
localparam TXPH_CFG = 'd291;
localparam TXPH_CFG2 = 'd51;
localparam TXPH_MONITOR_SEL = 'd0;
localparam TXPI_CFG0 = 'd768;
localparam TXPI_CFG1 = 'd4096;
localparam TXPI_GRAY_SEL = 'd0;
localparam TXPI_INVSTROBE_SEL = 'd0;
localparam TXPI_PPM = 'd0;
localparam TXPI_PPM_CFG = 'd0;
localparam TXPI_SYNFREQ_PPM = 'd1;
localparam TXPMARESET_TIME = 'd3;
localparam TXREFCLKDIV2_SEL = 'd0;
localparam TXSWBST_BST = 'd1;
localparam TXSWBST_EN = 'd0;
localparam TXSWBST_MAG = 'd4;
localparam TXSYNC_MULTILANE = 'd0;
localparam TXSYNC_OVRD = 'd0;
localparam TXSYNC_SKIP_DA = 'd0;
localparam TX_CLK25_DIV = 'd7;
localparam TX_CLKMUX_EN = 'd1;
localparam TX_DATA_WIDTH = 'd32;
localparam TX_DCC_LOOP_RST_CFG = 'd4;
localparam TX_DIVRESET_TIME = 'd1;
localparam TX_EIDLE_ASSERT_DELAY = 'd4;
localparam TX_EIDLE_DEASSERT_DELAY = 'd3;
localparam TX_FABINT_USRCLK_FLOP = 'd0;
localparam TX_FIFO_BYP_EN = 'd1;
localparam TX_INT_DATAWIDTH = 'd1;
localparam TX_LOOPBACK_DRIVE_HIZ = "FALSE";
localparam TX_MAINCURSOR_SEL = 'd0;
localparam TX_OUTCLK_BUFG_GT_DIV = 'd1;
localparam TX_PHICAL_CFG0 = 'd32;
localparam TX_PHICAL_CFG1 = 'd64;
localparam TX_PI_BIASSET = 'd1;
localparam TX_PMA_POWER_SAVE = 'd0;
localparam TX_PMA_RSV0 = 'd4;
localparam TX_PMA_RSV1 = 'd0;
localparam TX_PROGCLK_SEL = "PREPI";
localparam real TX_PROGDIV_CFG = 8.0;
localparam TX_PROGDIV_RATE = 'd1;
localparam TX_SW_MEAS = 'd0;
localparam TX_VREG_CTRL = 'd3;
localparam TX_VREG_PDB = 'd1;
localparam TX_VREG_VREFSEL = 'd2;
localparam TX_XCLK_SEL = "TXUSR";
localparam USE_PCS_CLK_PHASE_SEL = 'd0;
localparam Y_ALL_MODE = 'd0;
localparam BGBYPASSB = 'd1;
localparam BGMONITORENB = 'd1;
localparam BGPDB = 'd1;
localparam BGRCALOVRD = 'd16;
localparam BGRCALOVRDENB = 'd1;
localparam CDRSTEPDIR = 'd0;
localparam CDRSTEPSQ = 'd0;
localparam CDRSTEPSX = 'd0;
localparam CFGRESET = 'd0;
localparam CLKRSVD0 = 'd0;
localparam CLKRSVD1 = 'd0;
localparam CPLLFREQLOCK = 'd0;
localparam CPLLLOCKDETCLK = 'd0;
localparam CPLLLOCKEN = 'd0;
localparam CPLLPD = 'd1;
localparam CPLLREFCLKSEL = 'd1;
localparam CPLLRESET = 'd1;
localparam CTLRXPAUSEACK = 'd0;
localparam CTLTXPAUSEREQ = 'd0;
localparam CTLTXRESENDPAUSE = 'd0;
localparam CTLTXSENDIDLE = 'd0;
localparam CTLTXSENDLFI = 'd0;
localparam CTLTXSENDRFI = 'd0;
localparam DMONFIFORESET = 'd0;
localparam DMONITORCLK = 'd0;
localparam DRPADDR = 'd0;
localparam DRPCLK = 'd0;
localparam DRPDI = 'd0;
localparam DRPEN = 'd0;
localparam DRPRST = 'd0;
localparam DRPWE = 'd0;
localparam EYESCANRESET = 'd0;
localparam EYESCANTRIGGER = 'd0;
localparam FREQOS = 'd0;
localparam GTGREFCLK = 'd0;
localparam GTGREFCLK0 = 'd0;
localparam GTGREFCLK1 = 'd0;
localparam GTNORTHREFCLK0 = 'd0;
localparam GTNORTHREFCLK00 = 'd0;
localparam GTNORTHREFCLK01 = 'd0;
localparam GTNORTHREFCLK1 = 'd0;
localparam GTNORTHREFCLK10 = 'd0;
localparam GTNORTHREFCLK11 = 'd0;
localparam GTREFCLK0 = 'd0;
localparam GTREFCLK00 = 'd0;
localparam GTREFCLK01 = 'd0;
localparam GTREFCLK1 = 'd0;
localparam GTREFCLK10 = 'd0;
localparam GTREFCLK11 = 'd0;
localparam GTRSVD = 'd0;
localparam GTRXRESET = 'd0;
localparam GTRXRESETSEL = 'd0;
localparam GTSOUTHREFCLK0 = 'd0;
localparam GTSOUTHREFCLK00 = 'd0;
localparam GTSOUTHREFCLK01 = 'd0;
localparam GTSOUTHREFCLK1 = 'd0;
localparam GTSOUTHREFCLK10 = 'd0;
localparam GTSOUTHREFCLK11 = 'd0;
localparam GTTXRESET = 'd0;
localparam GTTXRESETSEL = 'd0;
localparam INCPCTRL = 'd0;
localparam LOOPBACK = 'd0;
localparam PCSRSVDIN = 'd0;
localparam PMARSVD0 = 'd0;
localparam PMARSVD1 = 'd0;
localparam QPLL0CLK = 'd0;
localparam QPLL0CLKRSVD0 = 'd0;
localparam QPLL0CLKRSVD1 = 'd0;
localparam QPLL0FBDIV = 'd0;
localparam QPLL0FREQLOCK = 'd0;
localparam QPLL0LOCKDETCLK = 'd0;
localparam QPLL0LOCKEN = 'd1;
localparam QPLL0PD = 'd0;
localparam QPLL0REFCLK = 'd0;
localparam QPLL0REFCLKSEL = 'd1;
localparam QPLL0RESET = 'd0;
localparam QPLL1CLK = 'd0;
localparam QPLL1CLKRSVD0 = 'd0;
localparam QPLL1CLKRSVD1 = 'd0;
localparam QPLL1FBDIV = 'd0;
localparam QPLL1FREQLOCK = 'd0;
localparam QPLL1LOCKDETCLK = 'd0;
localparam QPLL1LOCKEN = 'd0;
localparam QPLL1PD = 'd1;
localparam QPLL1REFCLK = 'd0;
localparam QPLL1REFCLKSEL = 'd1;
localparam QPLL1RESET = 'd1;
localparam QPLLRSVD1 = 'd0;
localparam QPLLRSVD2 = 'd0;
localparam QPLLRSVD3 = 'd0;
localparam QPLLRSVD4 = 'd0;
localparam RCALENB = 'd1;
localparam RESETOVRD = 'd0;
localparam RXAFECFOKEN = 'd1;
localparam RXCDRFREQRESET = 'd0;
localparam RXCDRHOLD = 'd0;
localparam RXCDROVRDEN = 'd0;
localparam RXCDRRESET = 'd0;
localparam RXCKCALRESET = 'd0;
localparam RXCKCALSTART = 'd0;
localparam RXDFEAGCHOLD = 'd0;
localparam RXDFEAGCOVRDEN = 'd0;
localparam RXDFECFOKFCNUM = 'd13;
localparam RXDFECFOKFEN = 'd0;
localparam RXDFECFOKFPULSE = 'd0;
localparam RXDFECFOKHOLD = 'd0;
localparam RXDFECFOKOVREN = 'd0;
localparam RXDFEKHHOLD = 'd0;
localparam RXDFEKHOVRDEN = 'd0;
localparam RXDFELFHOLD = 'd0;
localparam RXDFELFOVRDEN = 'd0;
localparam RXDFELPMRESET = 'd0;
localparam RXDFETAP10HOLD = 'd0;
localparam RXDFETAP10OVRDEN = 'd0;
localparam RXDFETAP11HOLD = 'd0;
localparam RXDFETAP11OVRDEN = 'd0;
localparam RXDFETAP12HOLD = 'd0;
localparam RXDFETAP12OVRDEN = 'd0;
localparam RXDFETAP13HOLD = 'd0;
localparam RXDFETAP13OVRDEN = 'd0;
localparam RXDFETAP14HOLD = 'd0;
localparam RXDFETAP14OVRDEN = 'd0;
localparam RXDFETAP15HOLD = 'd0;
localparam RXDFETAP15OVRDEN = 'd0;
localparam RXDFETAP2HOLD = 'd0;
localparam RXDFETAP2OVRDEN = 'd0;
localparam RXDFETAP3HOLD = 'd0;
localparam RXDFETAP3OVRDEN = 'd0;
localparam RXDFETAP4HOLD = 'd0;
localparam RXDFETAP4OVRDEN = 'd0;
localparam RXDFETAP5HOLD = 'd0;
localparam RXDFETAP5OVRDEN = 'd0;
localparam RXDFETAP6HOLD = 'd0;
localparam RXDFETAP6OVRDEN = 'd0;
localparam RXDFETAP7HOLD = 'd0;
localparam RXDFETAP7OVRDEN = 'd0;
localparam RXDFETAP8HOLD = 'd0;
localparam RXDFETAP8OVRDEN = 'd0;
localparam RXDFETAP9HOLD = 'd0;
localparam RXDFETAP9OVRDEN = 'd0;
localparam RXDFEUTHOLD = 'd0;
localparam RXDFEUTOVRDEN = 'd0;
localparam RXDFEVPHOLD = 'd0;
localparam RXDFEVPOVRDEN = 'd0;
localparam RXDFEXYDEN = 'd1;
localparam RXDLYBYPASS = 'd0;
localparam RXDLYEN = 'd0;
localparam RXDLYOVRDEN = 'd0;
localparam RXDLYSRESET = 'd0;
localparam RXELECIDLEMODE = 'd3;
localparam RXLPMEN = 'd0;
localparam RXLPMGCHOLD = 'd0;
localparam RXLPMGCOVRDEN = 'd0;
localparam RXLPMHFHOLD = 'd0;
localparam RXLPMHFOVRDEN = 'd0;
localparam RXLPMLFHOLD = 'd0;
localparam RXLPMLFKLOVRDEN = 'd0;
localparam RXLPMOSHOLD = 'd0;
localparam RXLPMOSOVRDEN = 'd0;
localparam RXMONITORSEL = 'd0;
localparam RXOSCALRESET = 'd0;
localparam RXOSHOLD = 'd0;
localparam RXOSOVRDEN = 'd0;
localparam RXOUTCLKSEL = 'd5;
localparam RXPCSRESET = 'd0;
localparam RXPD = 'd0;
localparam RXPHALIGN = 'd0;
localparam RXPHALIGNEN = 'd0;
localparam RXPHDLYPD = 'd0;
localparam RXPHDLYRESET = 'd0;
localparam RXPLLCLKSEL = 'd3;
localparam RXPMARESET = 'd0;
localparam RXPOLARITY = 'd0;
localparam RXPRBSCNTRESET = 'd0;
localparam RXPRBSSEL = 'd0;
localparam RXPROGDIVRESET = 'd0;
localparam RXSLIPOUTCLK = 'd0;
localparam RXSLIPPMA = 'd0;
localparam RXSYNCALLIN = 'd0;
localparam RXSYNCIN = 'd0;
localparam RXSYNCMODE = 'd1;
localparam RXSYSCLKSEL = 'd2;
localparam RXTERMINATION = 'd0;
localparam RXUSERRDY = 'd1;
localparam RXUSRCLK = 'd0;
localparam RXUSRCLK2 = 'd0;
localparam SDM0DATA = 'd0;
localparam SDM0RESET = 'd0;
localparam SDM0TOGGLE = 'd0;
localparam SDM0WIDTH = 'd0;
localparam SDM1DATA = 'd0;
localparam SDM1RESET = 'd0;
localparam SDM1TOGGLE = 'd0;
localparam SDM1WIDTH = 'd0;
localparam TSTIN = 'd0;
localparam TXAXISTDATA = 'd0;
localparam TXAXISTERR = 'd0;
localparam TXAXISTLAST = 'd0;
localparam TXAXISTPOISON = 'd0;
localparam TXAXISTPRE = 'd0;
localparam TXAXISTSOF = 'd0;
localparam TXAXISTTERM = 'd0;
localparam TXAXISTVALID = 'd0;
localparam TXDCCFORCESTART = 'd0;
localparam TXDCCRESET = 'd0;
localparam TXDIFFCTRL = 'd24;
localparam TXDLYBYPASS = 'd0;
localparam TXDLYEN = 'd0;
localparam TXDLYHOLD = 'd0;
localparam TXDLYOVRDEN = 'd0;
localparam TXDLYSRESET = 'd0;
localparam TXDLYUPDOWN = 'd0;
localparam TXELECIDLE = 'd0;
localparam TXGBSEQSYNC = 'd0;
localparam TXMUXDCDEXHOLD = 'd0;
localparam TXMUXDCDORWREN = 'd0;
localparam TXOUTCLKSEL = 'd5;
localparam TXPCSRESET = 'd0;
localparam TXPD = 'd0;
localparam TXPHALIGN = 'd0;
localparam TXPHALIGNEN = 'd0;
localparam TXPHDLYPD = 'd0;
localparam TXPHDLYRESET = 'd0;
localparam TXPHDLYTSTCLK = 'd0;
localparam TXPHINIT = 'd0;
localparam TXPHOVRDEN = 'd0;
localparam TXPIPPMEN = 'd0;
localparam TXPIPPMOVRDEN = 'd0;
localparam TXPIPPMPD = 'd1;
localparam TXPIPPMSEL = 'd0;
localparam TXPIPPMSTEPSIZE = 'd0;
localparam TXPISOPD = 'd0;
localparam TXPLLCLKSEL = 'd3;
localparam TXPMARESET = 'd0;
localparam TXPOLARITY = 'd0;
localparam TXPOSTCURSOR = 'd0;
localparam TXPRBSFORCEERR = 'd0;
localparam TXPRBSSEL = 'd0;
localparam TXPRECURSOR = 'd0;
localparam TXPROGDIVRESET = 'd0;
localparam TXRAWDATA = 'd0;
localparam TXSYNCALLIN = 'd0;
localparam TXSYNCIN = 'd0;
localparam TXSYNCMODE = 'd1;
localparam TXSYSCLKSEL = 'd2;
localparam TXUSERRDY = 'd1;
localparam TXUSRCLK = 'd0;
localparam TXUSRCLK2 = 'd0;
localparam CBCC_DATA_SOURCE_SEL = "DECODED";
localparam FTS_LANE_DESKEW_EN = "FALSE";
localparam RXCDR_PH_RESET_ON_EIDLE = 1'b0;
localparam RXGEARBOX_EN = "FALSE";
localparam RX_DISPERR_SEQ_MATCH = "TRUE";
localparam SATA_CPLL_CFG = "VCO_3000MHZ";
localparam USE_RAW_ELEC = 1'b0;
localparam [0:0] DELAY_ELEC = 1'b0;
localparam [0:0] RX_RESLOAD_OVRD = 1'b0;
localparam [0:0] TX_IDLE_DATA_ZERO = 1'b0;
localparam [0:0] TX_PMADATA_OPT = 1'b0;
localparam [1:0] DDI_CTRL = 2'b00;
localparam [1:0] RX_WIDEMODE_CDR_GEN3 = 2'b01;
localparam [1:0] RX_WIDEMODE_CDR_GEN4 = 2'b01;
localparam [2:0] RX_SAMPLE_PERIOD = 3'b101;
localparam [2:0] TX_SAMPLE_PERIOD = 3'b101;
localparam [3:0] FTS_DESKEW_SEQ_ENABLE = 4'b1111;
localparam [3:0] FTS_LANE_DESKEW_CFG = 4'b1111;
localparam [3:0] RX_RESLOAD_CTRL = 4'b0000;
localparam [4:0] A_TXDIFFCTRL = 5'b01100;
localparam [4:0] GEARBOX_MODE = 5'b00000;
localparam [4:0] RXBUFRESET_TIME = 5'b00001;
localparam [5:0] RX_DDI_SEL = 6'b000000;
localparam integer DDI_REALIGN_WAIT = 15;
localparam integer RXGBOX_FIFO_INIT_RD_ADDR = 4;
localparam integer TXGBOX_FIFO_INIT_RD_ADDR = 4;
