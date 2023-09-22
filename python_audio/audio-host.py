from scipy.io.wavfile import read

import numpy as np
import matplotlib.pyplot as plt

rate, data = read('1128-01.wav') # reading wave file.
print("Sample rate:{} Hz".format(rate))
print("Data type: {}".format(data.dtype))

plt.figure(figsize=(15, 5))
plt,plot(data[0:80000])
plt.show()


