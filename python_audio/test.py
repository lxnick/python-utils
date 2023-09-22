import numpy as np
import matplotlib.pyplot at plt
from scipy.io.wavfile import read, write
from IPython.display import Audio
from numpy.fft import fft, ifft
%matplotlib inline

Fs, data = read('test.wav')
data = data[:,0]
print("Sampling Frequence is", Fs)


