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
import imageio.v2 as imageio
#from vicoco.vivado_runner import get_runner
#new!!!
from cocotb_bus.bus import Bus
from cocotb_bus.drivers import BusDriver
from cocotb_bus.monitors import Monitor
from cocotb_bus.monitors import BusMonitor
from cocotb_bus.scoreboard import Scoreboard
import numpy as np
test_file = os.path.basename(__file__).replace(".py","")

proj_path = Path(__file__).resolve().parent.parent

import matplotlib.pyplot as plt   # add at top

def construct_frame(samples, max_lines=525):
    """
    input samples: {20'b0, trigger, oddeven, state_val, luminance}
    we get a batch of samples 

    image = [
                [line1],
                [line2],
                [line3],
                ...
            ]

    frame = [
                image1,
                image2,
                ...
            ]

    returns a frame
    """
    # pixel = sample & 0xFF
    # state = (sample >> 8) & 7
    # oddeven = sample >> 11 & 1
    # trigger = sample >> 12 & 1

    def insert_row(frame, line_number, row):
        if len(row) < num_samples:
            new_row = np.pad(row, (0, num_samples - len(row)))
        np.insert(frame, line_number, np.array(new_row), axis=0)

    # frames = []
    num_samples = 700 # change later
    frame = np.zeros((525, num_samples), dtype=np.uint8)
    cur_line = []
    state = 0 # 0 = idle wait for trigger, 1 = keep on appending pixels, and reset if needed

    oddeven_count = 0 # need to get to 1 to make a whole frame

    while oddeven_count < 2:
        for i, trigger, oddeven, state, pixel in enumerate(samples):
            if state == 0: # waiting for first trigger
                if trigger:
                    state = 1
                    line_num = oddeven
            else:
                if trigger:
                    if len(cur_line) > 0:
                        row_to_insert = np.array(cur_line)
                        insert_row(frame, line_num, row_to_insert)
                        line_num += 2
                    cur_line = []
                else:
                    cur_line.append(pixel)
        oddeven_count += 1
    return frame

def plot_frames(frames):
    for vals in frames:
        img = np.array(vals, dtype=np.uint8)   # convert 2-D list → 2-D array
        frames.append(img)
    imageio.mimsave("video.mp4", frames, fps=20)

def build_frame_from_samples(samples, max_lines=525):
    """
    Convert a flat list of (interlace, vsync, hsync, luma) tuples
    into a 2-D numpy array [lines, pixels].

    Simple algorithm:
      - a rising vsync starts a new frame (we just take the first one)
      - each hsync pulse starts a new line
      - luma samples when no sync bits are asserted are treated as pixels
    """

    lines = []
    cur_line = []

    in_frame = False
    prev_vsync = 0

    for interlace, vsync, hsync, luma in samples:
        # detect start of a frame on vsync rising edge
        if vsync and not prev_vsync:
            if in_frame:
                # second vsync -> end of first frame
                break
            in_frame = True
            cur_line = []
            lines = []
            prev_vsync = vsync
            continue

        prev_vsync = vsync

        if not in_frame:
            continue

        # start a new line on hsync assertion
        if hsync:
            if cur_line:
                lines.append(cur_line)
            cur_line = []
            continue

        # regular pixel sample (no sync bits set)
        if not vsync and not hsync:
            cur_line.append(luma)

        if len(lines) >= max_lines:
            break

    # push last line
    if cur_line:
        lines.append(cur_line)

    if not lines:
        return np.zeros((1, 1), dtype=np.uint8)

    # make rectangular image: pad/truncate each line to same width
    width = max(len(line) for line in lines)
    img = np.zeros((len(lines), width), dtype=np.uint8)
    for i, line in enumerate(lines):
        n = min(len(line), width)
        img[i, :n] = line[:n]

    return img



def make_default_mmio_thresholds():
    """
    Pack the default thresholds from top.sv into a single integer
    matching MMIO_thresholds[151:0].

    Byte ordering (LSB first):
      0  vsync_low_threshold               ~172
      1  vsync_high_threshold              ~185
      2  vsync_region_length_low_threshold ~200
      3  black_level_default               ~150
      4  white_level_default               ~40
      5  hsync_threshold_lower_ls          ~128
      6  hsync_threshold_upper_ls          ~136
      7  hsync_threshold_lower_hs          ~184
      8  hsync_threshold_upper_hs          ~190
      9  hsync_threshold_lower_vd          ~75
     10  hsync_threshold_upper_vd          ~100
     11  hsync_threshold_lower_fp          ~133
     12  hsync_threshold_upper_fp          ~138
     13  hsync_threshold_lower_st          ~184
     14  hsync_threshold_upper_st          ~192
     15  hsync_threshold_lower_bp          ~134
     16  hsync_threshold_upper_bp          ~142
     17  hsync_threshold_lower_eq          ~135
     18  hsync_threshold_upper_eq          ~142
    """
    threshold_bytes = [
        172, 185, 200,
        150,  40,
        128, 136,
        184, 190,
         75, 100,
        133, 138,
        184, 192,
        134, 142,
        135, 142,
    ]
    mmio_val = 0
    for i, b in enumerate(threshold_bytes):
        mmio_val |= (b & 0xFF) << (8 * i)
    return mmio_val



class AXISMonitor(BusMonitor):
    """
    monitors axi streaming bus
    """
    transactions = 0 #use this variable to track good ready/valid handshakes
    def __init__(self, dut, name, clk, callback=None):
        self._signals = ['axis_tvalid','axis_tready','axis_tlast','axis_tdata','axis_tstrb']
        BusMonitor.__init__(self, dut, name, clk, callback=callback)
        self.clock = clk
        self.transactions = 0
    async def _monitor_recv(self):
        """
        Monitor receiver
        """
        rising_edge = RisingEdge(self.clock) # make these coroutines once and reuse
        falling_edge = FallingEdge(self.clock)
        read_only = ReadOnly() #This is
        while True:
            await rising_edge
            await falling_edge #sometimes see in AXI shit
            await read_only  #readonly (the postline)
            valid = self.bus.axis_tvalid.value
            ready = self.bus.axis_tready.value
            last = self.bus.axis_tlast.value
            data = self.bus.axis_tdata.value #.signed_integer
            if valid and ready:
                self.transactions+=1
                thing = dict(data=data.signed_integer,last=last,name=self.name,count=self.transactions,time=gst())
                #print(f"{self.name}: {thing}")
                self._recv(data)

class AXISDriver(BusDriver):
    def __init__(self, dut, name, clk, role="M"):
        self._signals = ['axis_tvalid', 'axis_tready', 'axis_tlast', 'axis_tdata','axis_tstrb']
        BusDriver.__init__(self, dut, name, clk)
        self.clock = clk
        if role=='M':
            self.role = role
            self.bus.axis_tdata.value = 0
            self.bus.axis_tstrb.value = 0
            self.bus.axis_tlast.value = 0
            self.bus.axis_tvalid.value = 0
        elif role == 'S':
            self.role = role
            self.bus.axis_tready.value = 0
        else:
            raise ValueError("role can only be 'M' or 'S'")

    async def _driver_send(self, value, sync=True):
        rising_edge = RisingEdge(self.clock) # make these coroutines once and reuse
        falling_edge = FallingEdge(self.clock)
        read_only = ReadOnly() #This is
        if self.role == 'M':
            if value.get("type") == "write_single":
                await falling_edge #wait until after a rising edge has passed.
                self.bus.axis_tdata.value = value.get('contents').get('data')
                self.bus.axis_tstrb.value = 0xF
                self.bus.axis_tlast.value = value.get('contents').get('last')
                self.bus.axis_tvalid.value = 1 #set valid to be 1
                await read_only
                if self.bus.axis_tready.value == 0: #ifnot there...
                    await RisingEdge(self.bus.axis_tready) #wait until it does go high
                await rising_edge
                #self.bus.axis_tvalid.value = 0 #set to 0 and be done.
            elif value.get("type") == "pause":
                await falling_edge
                self.bus.axis_tvalid.value = 0 #set to 0 and be done.
                await ClockCycles(self.clock,value.get("duration",1))
            elif value.get("type") == "write_burst":
                data = value.get("contents").get("data")
                for i in range(len(data)):
                    await falling_edge
                    self.bus.axis_tdata.value = int(data[i])
                    if i == len(data)-1:
                        self.bus.axis_tlast.value = 1
                    else:
                        self.bus.axis_tlast.value = 0
                    self.bus.axis_tvalid.value = 1
                    if self.bus.axis_tready.value == 0:
                        await RisingEdge(self.bus.axis_tready)
                    await rising_edge
                #self.bus.axis_tvalid.value = 0
                #self.bus.axis_tlast.value = 0
            else:
                pass
        elif self.role == 'S':
            if value.get("type") == "pause":
                await falling_edge
                self.bus.axis_tready.value = 0 #set to 0 and be done.
                await ClockCycles(self.clock,value.get("duration",1))
            elif value.get("type") == "read_single":
                await falling_edge #wait until after a rising edge has passed.
                self.bus.axis_tready.value = 1 #set valid to be 1
                await read_only
                if self.bus.axis_tvalid.value == 0: #ifnot there...
                    await RisingEdge(self.bus.axis_tvalid) #wait until it does go high
                await rising_edge
                self.bus.axis_tready.value = 0 #set to 0 and be done.
            elif value.get("type") == "read_burst":
                for i in range(value.get("duration",1)):
                    await falling_edge #wait until after a rising edge has passed.
                    self.bus.axis_tready.value = 1 #set valid to be 1
                    await read_only
                    if self.bus.axis_tvalid.value == 0: #ifnot there...
                        await RisingEdge(self.bus.axis_tvalid) #wait until it does go high
                    await rising_edge
                self.bus.axis_tready.value = 0 #set to 0 and be done.

async def reset(clk,rst, cycles_held = 3,polarity=1):
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

@cocotb.test()
async def test_top(dut):
    """
    Basic cocotb test for top.sv:
    - Drive input AXIS stream with packed I/Q samples.
    - Observe m00_axis outputs and print decoded fields.
    """

    # AXIS interfaces for s00 (input to DUT)
    inm = AXISMonitor(dut, 's00', dut.s00_axis_aclk)
    ind = AXISDriver(dut, 's00', dut.s00_axis_aclk, "M")

    # 64 MHz-ish clocks for both domains
    cocotb.start_soon(Clock(dut.s00_axis_aclk, 15626, units="ps").start())
    cocotb.start_soon(Clock(dut.m00_axis_aclk, 15626, units="ps").start())

    # Reset both domains (active-low)
    await reset(dut.s00_axis_aclk, dut.s00_axis_aresetn, 2, 0)
    await reset(dut.m00_axis_aclk, dut.m00_axis_aresetn, 2, 0)

    # Always-ready downstream FIFO
    dut.m00_axis_tready.value = 1

    # Load example ADC data (real & imag)
    real_array = np.load(proj_path / "sim" / "real_array_pattern.npy")
    imag_array = np.load(proj_path / "sim" / "imag_array_pattern.npy")

    real_data = real_array.astype(np.int16)
    imag_data = imag_array.astype(np.int16)

    # Pack I/Q into 32-bit words: [31:16] = I, [15:0] = Q
    packed_data = (real_data.astype(np.uint32) << 16) | (imag_data.astype(np.uint32) & 0xFFFF)

    # 1) encode thresholds based on top.sv defaults
    dut.MMIO_thresholds.value = make_default_mmio_thresholds()

    samples = []
    frames = []

    # 2) monitor m00_axis_tdata and print fields on valid handshake
    async def watch_m00():
        while True:
            await RisingEdge(dut.m00_axis_aclk)
            if dut.m00_axis_tvalid.value and dut.m00_axis_tready.value:
                raw = int(dut.m00_axis_tdata.value)
                # flags = (raw >> 9) & 0xF     # bits [12:9]
                # luma  =  raw        & 0x1FF  # bits [8:0]
                # print(
                #     f"[m00] time={gst()} ps  "
                #     f"flags[12:9]={flags:04b}  "
                #     f"luma[8:0]={luma}"
                # )

                pixel = raw & 0xFF
                state = (raw >> 8) & 7
                oddeven = (raw >> 11) & 1
                trigger = (raw >> 12) & 1
                samples = [] # THEN samples reset
                while (state != 0 and state != 1): # dont append anything when in IDLE or FRAME_SYNC
                    pixel = raw & 0xFF
                    state = (raw >> 8) & 7
                    oddeven = raw >> 11 & 1
                    trigger = raw >> 12 & 1
                    samples.append((trigger, oddeven, state, pixel))
                construct_frame(samples)

    cocotb.start_soon(watch_m00())
    # cocotb.start_soon(collect_frames())

    # Drive the AXIS input
    data = {'type': 'write_burst', "contents": {"data": packed_data}}
    ind.append(data)
    pause = {"type": "pause", "duration": 1}
    ind.append(pause)

    # Let the design run long enough to chew through all samples
    await ClockCycles(dut.s00_axis_aclk, len(real_array) + 200)

    # now samples[] is filled – build and plot a frame:
    # frame = build_frame_from_samples(samples)
    # np.save("frame.npy", frame)  # if you want to inspect later
    # plt.imshow(frame, cmap="gray", vmin=0, vmax=255)
    # plt.title("Captured frame")
    # plt.savefig("frame.png")
    plot_frames(frames)



def adsb_runner():
    """Simulate the ADSB decoder using the Python runner."""
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
    sim = os.getenv("SIM", "icarus")
    #sim = os.getenv("SIM", "vivado")
    sys.path.append(str(proj_path / "sim" / "model"))
    sys.path.append(str(proj_path / "hdl" ))
    #sources = [proj_path / "hdl" / "vsync_detector.sv"]
    sources = [proj_path / "hdl" / "cordic.sv", proj_path / "hdl" / "top.sv", proj_path / "hdl" / "video_data_decoder.sv", proj_path / "hdl" / "vsync_detector.sv", proj_path / "hdl" / "hsync_detector.sv"]
    #sources = [proj_path / "hdl" / "axis_fir.sv", proj_path / "hdl" / "preamble_detector.sv", proj_path / "hdl" / "top.sv", proj_path / "hdl" / "adsb_decoder.sv", proj_path / "hdl" / "cordic.sv"]
    #sources = [proj_path / "hdl" / "j_math.sv"]
    build_test_args = ["-Wall"]
    parameters = {} #!!!
    sys.path.append(str(proj_path / "sim"))
    runner = get_runner(sim)
    hdl_toplevel = "top"
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
    adsb_runner()
