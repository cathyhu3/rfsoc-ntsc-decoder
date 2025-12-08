#!/usr/bin/env python3

from typing import Any
import cocotb
import os
import random
import sys
from math import log
import numpy
import logging
from pathlib import Path
from cocotb.clock import Clock
from cocotb.triggers import Timer, ClockCycles, RisingEdge, FallingEdge, ReadOnly,with_timeout
from cocotb.utils import get_sim_time as gst
from cocotb.runner import get_runner
from cocotb_bus.bus import Bus
from cocotb_bus.drivers import BusDriver
from cocotb_bus.monitors import Monitor
from cocotb_bus.monitors import BusMonitor
from cocotb_bus.scoreboard import Scoreboard
import numpy as np
test_file = os.path.basename(__file__).replace(".py","")

proj_path = Path(__file__).resolve().parent.parent


async def reset(clk,rst, cycles_held = 3,polarity=0):
    rst.value = polarity
    await ClockCycles(clk, cycles_held)
    rst.value = not polarity

'''
{"type":"write_single", "contents": {"data":5, "last":0}}
{"type":"pause","duration":10}
{"type":"write_burst", "contents": {"data": np.array(9*[0]+[1]+30*[0]+[-2]+59*[0])}}
{"type":"read_single"}
{"type":"read_burst", "duration":10}
'''
### WHITE ###
# imag_array_white = np.load(proj_path / "sim" / "imag_array_white.npy")[:700]
# real_array_white = np.load(proj_path / "sim" / "real_array_white.npy")[:700]
# t_array_white = np.load(proj_path / "sim" / "t_array_white.npy")[:700]

# mag_in = np.round(np.abs(real_array_white + 1j*imag_array_white)).astype(int).tolist()

## PATTERN ###
imag_array_pattern = np.load(proj_path / "sim" / "imag_array_pattern.npy")[14000:28000]
real_array_pattern = np.load(proj_path / "sim" / "real_array_pattern.npy")[14000:28000]
t_array_pattern = np.load(proj_path / "sim" / "t_array_pattern.npy")[14000:28000]
colorburst_triggers = np.load(proj_path/ "data" / "colorburst_triggers.npy")
# imag_array_pattern = np.load(proj_path / "sim" / "imag_array_pattern.npy")[20000:20500]
# real_array_pattern = np.load(proj_path / "sim" / "real_array_pattern.npy")[20000:20500]
# t_array_pattern = np.load(proj_path / "sim" / "t_array_pattern.npy")[20000:20500]
# imag_array_pattern = np.load(proj_path / "sim" / "imag_array_black.npy")[20000:28000]
# real_array_pattern = np.load(proj_path / "sim" / "real_array_black.npy")[20000:28000]
# t_array_pattern = np.load(proj_path / "sim" / "t_array_black.npy")[20000:28000]

mag_in = np.round(np.abs(real_array_pattern + 1j*imag_array_pattern)).astype(int).tolist()
triggers = colorburst_triggers.astype(int).tolist()

@cocotb.test()
async def test_a(dut):

    # Start clock
    cocotb.start_soon(Clock(dut.s00_axis_aclk, 126, units="ns").start())
    
    # Reset the module
    await reset(dut.s00_axis_aclk, dut.s00_axis_aresetn, 2, 0)
    
    # Set threshold levels (black_level and white_level)
    dut.black_level.value = 150
    dut.white_level.value = 40
    
    # Set tlast 
    dut.s00_axis_tlast.value = 0
    dut.s00_axis_tdata.value = 0
    dut.s00_axis_tvalid.value = 0
    
    # Wait a few cycles after reset
    await ClockCycles(dut.s00_axis_aclk, 2)
    
    dut._log.info(f"Starting test")

    # Feed data into the module
    # Input format: {11'b0, colorburst_trigger[19], evenodd[18], state[17:16], magnitude[15:0]}
    for i, mag in enumerate(mag_in):
        # Get trigger value
        trigger_val = triggers[i] if i < len(triggers) else 0
        
        # Generate random values for evenodd and state
        evenodd = 1
        state = 3
        
        # Construct the 32-bit input data
        # bits [31:20] = 0, [19] = colorburst_trigger, [18] = evenodd, [17:16] = state, [15:0] = magnitude
        input_data_word = (trigger_val << 19) | (evenodd << 18) | (state << 16) | (mag & 0xFFFF)
        
        # Set data
        await FallingEdge(dut.s00_axis_aclk)
        dut.s00_axis_tdata.value = input_data_word
        dut.s00_axis_tvalid.value = 1
        
        await RisingEdge(dut.s00_axis_aclk)
        await FallingEdge(dut.s00_axis_aclk)
        
        # Deassert valid, but keep data (or set to 0)
        dut.s00_axis_tvalid.value = 0
    
    await FallingEdge(dut.s00_axis_aclk)
    dut.s00_axis_tdata.value = 0
    dut.s00_axis_tvalid.value = 0

    # Wait for remaining outputs
    await ClockCycles(dut.s00_axis_aclk, 500)
    

def decoder_runner(module_name):
    """Simulate the ADSB decoder using the Python runner."""
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
    sim = os.getenv("SIM", "icarus")
    #sim = os.getenv("SIM", "vivado")
    sys.path.append(str(proj_path / "sim" / "model"))
    sys.path.append(str(proj_path / "hdl" ))
    sources = [proj_path / "hdl" / "video_data_decoder.sv"]
    build_test_args = ["-Wall"]
    parameters = {} #!!!
    sys.path.append(str(proj_path / "sim"))
    runner = get_runner(sim)
    hdl_toplevel = module_name[:-3]
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        always=True,
        build_args=build_test_args,
        parameters=parameters,
        timescale = ('1ps','1fs'),
        waves=True
    )
    run_test_args = []
    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module=test_file,
        test_args=run_test_args,
        waves=True
    )
if __name__ == "__main__":
    decoder_runner("video_data_decoder.sv")