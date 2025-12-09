import numpy as np

def set_row(frame, row_number, line_of_pixels, num_samples):
    # pad or trim to exactly num_samples
    if len(line_of_pixels) < num_samples:
        new_row = np.pad(line_of_pixels, (0, num_samples - len(line_of_pixels)))
    else:
        new_row = np.array(line_of_pixels[:num_samples])

    frame[row_number] = new_row
    return frame


num_samples = 10
frame = np.zeros((3, num_samples), dtype=np.uint8)

frame = set_row(frame, 2, [1, 2, 3, 4, 5], num_samples)
print(frame)

