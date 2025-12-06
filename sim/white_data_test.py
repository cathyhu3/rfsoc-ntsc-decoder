import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

proj_path = Path(__file__).resolve().parent.parent

imag_array_white = np.load(proj_path / "sim" / "imag_array_white.npy")
real_array_white = np.load(proj_path / "sim" / "real_array_white.npy")
t_array_white = np.load(proj_path / "sim" / "t_array_white.npy")

mag_in = np.round(np.abs(real_array_white + 1j*imag_array_white))
mag_in = mag_in.astype(int).tolist()
print(type(mag_in[0]))
# plt.plot(t_array_white*8, mag_in)
# plt.show()


