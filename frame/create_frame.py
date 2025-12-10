import numpy as np

samples = [
    (0, 0, 0, 0),
    (0, 0, 0, 0),
    (1, 0, 4, 0),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),
    (0, 0, 5, 9),

]

def create_frames(samples, height=3, width=10):
    """
    frames = [
                curr_frame1=[line1, line2, ...], 
                curr_frame2,
                ...
                ]
    """
    def set_row(frame, row_ix, pixel_line, width):
        if len(pixel_line) < width:
            pixel_line = np.pad(pixel_line, (0, width-len(pixel_line)))
        else:
            pixel_line = np.array(pixel_line[:width])
        frame[row_ix] = pixel_line
        return frame
    
    
    
    frames = []
    curr_frame = np.zeros((height, width), dtype=np.uint8)
    line = []
    
    
    frame_state = 0 # 0 = WAIT, 1 = found trigger
    past_trigger = 0
    row_ix = 0
    oddeven_count = 0
    for (trigger, oddeven, state, pixel) in samples:
        # FRAME STATE = 0 (wait for trigger)
        if (frame_state==0): 
            if trigger: # wait until wse trigger out of the WAIT state
                frame_state = 1
                row_ix = oddeven
            else:
                continue
        if (state == 5): # DECODE_LINE
            line.append(pixel)
        elif (state == 3): # COLORBURST
            frame = set_row(frame, row_ix, line, width)
            line = []
            row_ix += 2
        elif (state == 1 and oddeven_count == 0): # must wait for trigger again since only finished odd OR even
            frame_state = 0
            oddeven_count += 1
        elif (state == 1 and oddeven_count == 1): # FRAME_SYNC and curr_frame finished both odd AND even
            frames.append(curr_frame)
            frame_state = 0
    return curr_frame

print(create_frames(samples))