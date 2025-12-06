#!/usr/bin/env python3

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
#from vicoco.vivado_runner import get_runner
#new!!!
from cocotb_bus.bus import Bus
from cocotb_bus.drivers import BusDriver
from cocotb_bus.monitors import Monitor
from cocotb_bus.monitors import BusMonitor
from cocotb_bus.scoreboard import Scoreboard
import numpy as np
import matplotlib.pyplot as plt
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

### PATTERN ###
# imag_array_pattern = np.load(proj_path / "sim" / "imag_array_pattern.npy")[26000:28000]
# real_array_pattern = np.load(proj_path / "sim" / "real_array_pattern.npy")[26000:28000]
# t_array_pattern = np.load(proj_path / "sim" / "t_array_pattern.npy")[26000:28000]
imag_array_pattern = np.load(proj_path / "sim" / "imag_array_pattern.npy")[20000:28000]
real_array_pattern = np.load(proj_path / "sim" / "real_array_pattern.npy")[20000:28000]
t_array_pattern = np.load(proj_path / "sim" / "t_array_pattern.npy")[20000:28000]

mag_in = np.round(np.abs(real_array_pattern + 1j*imag_array_pattern)).astype(int).tolist()


async def collect_vals(dut, hsyncs, colorbursts, h_pulses, cb_pulses):
    # hsyncs = []
    # colorbursts = []
    # h_pulses = []
    # cb_pulses = []
    while len(hsyncs) < len(mag_in):
        await RisingEdge(dut.s00_axis_aclk)
        await ReadOnly()
        if (dut.m00_axis_tvalid.value):
            hsyncs.append(dut.m00_axis_tdata.value >> 17)
            colorbursts.append((dut.m00_axis_tdata.value >> 16) & 1)
            h_pulses.append(dut.hsync_pulse.value)
            cb_pulses.append(dut.cb_pulse.value)


@cocotb.test()
async def test_a(dut):
    """cocotb test for AXIS FIR15"""
    
    hsyncs = []
    colorbursts = []
    h_pulses = []
    cb_pulses = []

    #cocotb.start_soon(Clock(dut.s00_axis_aclk, 15625, units="ps").start()) # 64 MHz clock
    # cocotb.start_soon(Clock(dut.s00_axis_aclk, 15626, units="ps").start()) # 64 MHz clock, plus 1 ps so that /2 is even for simulator issues
    cocotb.start_soon(Clock(dut.s00_axis_aclk, 126, units="ns").start()) # 8 MHz clock
    cocotb.start_soon(collect_vals(dut, hsyncs, colorbursts, h_pulses, cb_pulses))
    await reset(dut.s00_axis_aclk, dut.s00_axis_aresetn,2,0)

    for mag in mag_in:
        await FallingEdge(dut.s00_axis_aclk)
        dut.s00_axis_tdata = mag
        dut.s00_axis_tvalid = 1
        await FallingEdge(dut.s00_axis_aclk)
        dut.s00_axis_tvalid = 0
        dut.m00_axis_tready = 1

    await ClockCycles(dut.s00_axis_aclk, 5)
    plt.plot(t_array_pattern*8, mag_in)
    # print(hsyncs)
    for i, b in enumerate(hsyncs):
        if b == 1:
            plt.axvline(x=20000+i, linestyle='-', linewidth=2, color="red", alpha=0.1)
    for i, b in enumerate(colorbursts):
        if b == 1:
            plt.axvline(x=20000+i, linestyle='-', linewidth=2, color="blue", alpha=0.1)
    for i, b in enumerate(h_pulses):
        if b == 1:
            plt.axvline(x=20000+i, linestyle='-', linewidth=2, color="green", alpha=0.9)
    for i, b in enumerate(cb_pulses):
        if b == 1:
            plt.axvline(x=20000+i, linestyle='-', linewidth=2, color="yellow", alpha=0.9)
    plt.show()
    # assert [0x8d780976990c83ad98041dc0fbd7, 0x8d780976990c83ad98041dc0fbd7] == received_squitters

def hsync_runner(module_name):
    """Simulate the ADSB decoder using the Python runner."""
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
    sim = os.getenv("SIM", "icarus")
    #sim = os.getenv("SIM", "vivado")
    sys.path.append(str(proj_path / "sim" / "model"))
    sys.path.append(str(proj_path / "hdl" ))
    sources = [proj_path / "hdl" / "hsync_detector_axis.sv"]
    #sources = [proj_path / "hdl" / "j_math.sv"]
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
    hsync_runner("hsync_detector_axis.sv")