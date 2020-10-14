
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "halfband_filter_1" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 0.000095367431640625,0.000000000000000000,-0.000267028808593750,0.000000000000000000,0.000560760498046875,0.000000000000000000,-0.001018524169921880,0.000000000000000000,0.001697540283203130,0.000000000000000000,-0.002655029296875000,0.000000000000000000,0.003971099853515630,0.000000000000000000,-0.005737304687500000,0.000000000000000000,0.008071899414062500,0.000000000000000000,-0.011135101318359399,0.000000000000000000,0.015182495117187500,0.000000000000000000,-0.020629882812500000,0.000000000000000000,0.028255462646484399,0.000000000000000000,-0.039733886718750000,0.000000000000000000,0.059448242187500000,0.000000000000000000,-0.103527069091797000,0.000000000000000000,0.317443847656250000,0.499996185302733990,0.317443847656250000,0.000000000000000000,-0.103527069091797000,0.000000000000000000,0.059448242187500000,0.000000000000000000,-0.039733886718750000,0.000000000000000000,0.028255462646484399,0.000000000000000000,-0.020629882812500000,0.000000000000000000,0.015182495117187500,0.000000000000000000,-0.011135101318359399,0.000000000000000000,0.008071899414062500,0.000000000000000000,-0.005737304687500000,0.000000000000000000,0.003971099853515630,0.000000000000000000,-0.002655029296875000,0.000000000000000000,0.001697540283203130,0.000000000000000000,-0.001018524169921880,0.000000000000000000,0.000560760498046875,0.000000000000000000,-0.000267028808593750,0.000000000000000000,0.000095367431640625
// chanpats: 173
// name: halfband_filter_1
// filter_type: 1
// rate_change: 0
// interp_rate: 2
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 6
// num_coeffs: 67
// coeff_sets: 1
// reloadable: 0
// is_halfband: 1
// quantization: 1
// coeff_width: 18
// coeff_fract_width: 18
// chan_seq: 0
// num_channels: 1
// num_paths: 2
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 1
// output_width: 18
// output_fract_width: 1
// config_method: 0

const double halfband_filter_1_coefficients[67] = {0.000095367431640625,0.000000000000000000,-0.000267028808593750,0.000000000000000000,0.000560760498046875,0.000000000000000000,-0.001018524169921880,0.000000000000000000,0.001697540283203130,0.000000000000000000,-0.002655029296875000,0.000000000000000000,0.003971099853515630,0.000000000000000000,-0.005737304687500000,0.000000000000000000,0.008071899414062500,0.000000000000000000,-0.011135101318359399,0.000000000000000000,0.015182495117187500,0.000000000000000000,-0.020629882812500000,0.000000000000000000,0.028255462646484399,0.000000000000000000,-0.039733886718750000,0.000000000000000000,0.059448242187500000,0.000000000000000000,-0.103527069091797000,0.000000000000000000,0.317443847656250000,0.499996185302733990,0.317443847656250000,0.000000000000000000,-0.103527069091797000,0.000000000000000000,0.059448242187500000,0.000000000000000000,-0.039733886718750000,0.000000000000000000,0.028255462646484399,0.000000000000000000,-0.020629882812500000,0.000000000000000000,0.015182495117187500,0.000000000000000000,-0.011135101318359399,0.000000000000000000,0.008071899414062500,0.000000000000000000,-0.005737304687500000,0.000000000000000000,0.003971099853515630,0.000000000000000000,-0.002655029296875000,0.000000000000000000,0.001697540283203130,0.000000000000000000,-0.001018524169921880,0.000000000000000000,0.000560760498046875,0.000000000000000000,-0.000267028808593750,0.000000000000000000,0.000095367431640625};

const xip_fir_v7_2_pattern halfband_filter_1_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_halfband_filter_1_config() {
  xip_fir_v7_2_config config;
  config.name                = "halfband_filter_1";
  config.filter_type         = 1;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 2;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &halfband_filter_1_coefficients[0];
  config.coeff_padding       = 6;
  config.num_coeffs          = 67;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 1;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 18;
  config.coeff_fract_width   = 18;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = halfband_filter_1_chanpats[0];
  config.num_paths           = 2;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 18;
  config.output_fract_width  = 1,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config halfband_filter_1_config = gen_halfband_filter_1_config();

