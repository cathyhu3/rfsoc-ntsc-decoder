
//------------------------------------------------------------------------------
// (c) Copyright 2023 Advanced Micro Devices. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "design_1_fir_compiler_0_1" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -0.08079731151295012,-0.056993321909308704,0.036145922921685635,-0.020006902732670605,0.007845346965586487,0.0013148162018981047,-0.007370194875647201,0.011245274010722898,-0.013032121792293232,0.013038141911222548,-0.011538166530483418,0.008632139966939527,-0.004754263244009773,0.00025726742061351834,0.004388062928655766,-0.008659548283908344,0.0121345041278455,-0.014306039905882134,0.014809755980614805,-0.013402874098491746,0.010031506662339075,-0.00495769724821669,-0.0013723371902587024,0.008273047983331486,-0.014927717571157907,0.020469335096868373,-0.02398511637039809,0.024690024374717814,-0.02196022088100367,0.015451040582011705,-0.005181540050606625,-0.008501196798671413,0.0248719972020057,-0.042923613617873786,0.06142981571381001,-0.07902431910218423,0.09438231636583418,-0.10629796994050311,0.11383895711169927,0.8835754821844373,0.11383895711169927,-0.10629796994050311,0.09438231636583418,-0.07902431910218423,0.06142981571381001,-0.042923613617873786,0.0248719972020057,-0.008501196798671413,-0.005181540050606625,0.015451040582011705,-0.02196022088100367,0.024690024374717814,-0.02398511637039809,0.020469335096868373,-0.014927717571157907,0.008273047983331486,-0.0013723371902587024,-0.00495769724821669,0.010031506662339075,-0.013402874098491746,0.014809755980614805,-0.014306039905882134,0.0121345041278455,-0.008659548283908344,0.004388062928655766,0.00025726742061351834,-0.004754263244009773,0.008632139966939527,-0.011538166530483418,0.013038141911222548,-0.013032121792293232,0.011245274010722898,-0.007370194875647201,0.0013148162018981047,0.007845346965586487,-0.020006902732670605,0.036145922921685635,-0.056993321909308704,-0.08079731151295012
// chanpats: 173
// name: design_1_fir_compiler_0_1
// filter_type: 0
// rate_change: 0
// interp_rate: 1
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 79
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 1
// coeff_width: 16
// coeff_fract_width: 15
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 7
// output_width: 16
// output_fract_width: 0
// config_method: 0

const double design_1_fir_compiler_0_1_coefficients[79] = {-0.08079731151295012,-0.056993321909308704,0.036145922921685635,-0.020006902732670605,0.007845346965586487,0.0013148162018981047,-0.007370194875647201,0.011245274010722898,-0.013032121792293232,0.013038141911222548,-0.011538166530483418,0.008632139966939527,-0.004754263244009773,0.00025726742061351834,0.004388062928655766,-0.008659548283908344,0.0121345041278455,-0.014306039905882134,0.014809755980614805,-0.013402874098491746,0.010031506662339075,-0.00495769724821669,-0.0013723371902587024,0.008273047983331486,-0.014927717571157907,0.020469335096868373,-0.02398511637039809,0.024690024374717814,-0.02196022088100367,0.015451040582011705,-0.005181540050606625,-0.008501196798671413,0.0248719972020057,-0.042923613617873786,0.06142981571381001,-0.07902431910218423,0.09438231636583418,-0.10629796994050311,0.11383895711169927,0.8835754821844373,0.11383895711169927,-0.10629796994050311,0.09438231636583418,-0.07902431910218423,0.06142981571381001,-0.042923613617873786,0.0248719972020057,-0.008501196798671413,-0.005181540050606625,0.015451040582011705,-0.02196022088100367,0.024690024374717814,-0.02398511637039809,0.020469335096868373,-0.014927717571157907,0.008273047983331486,-0.0013723371902587024,-0.00495769724821669,0.010031506662339075,-0.013402874098491746,0.014809755980614805,-0.014306039905882134,0.0121345041278455,-0.008659548283908344,0.004388062928655766,0.00025726742061351834,-0.004754263244009773,0.008632139966939527,-0.011538166530483418,0.013038141911222548,-0.013032121792293232,0.011245274010722898,-0.007370194875647201,0.0013148162018981047,0.007845346965586487,-0.020006902732670605,0.036145922921685635,-0.056993321909308704,-0.08079731151295012};

const xip_fir_v7_2_pattern design_1_fir_compiler_0_1_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_design_1_fir_compiler_0_1_config() {
  xip_fir_v7_2_config config;
  config.name                = "design_1_fir_compiler_0_1";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &design_1_fir_compiler_0_1_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 79;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_QUANTIZED_ONLY;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 15;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = design_1_fir_compiler_0_1_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_NON_SYMMETRIC_UP;
  config.output_width        = 16;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config design_1_fir_compiler_0_1_config = gen_design_1_fir_compiler_0_1_config();

