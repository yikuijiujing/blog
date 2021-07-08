% Purpose: Design a low-pass filter with a sampling frequency of 1000 Hz, a passband cutoff frequency of 50 Hz, and a stopband cutoff frequency of 100 Hz, and require a maximum passband attenuation of 1 dB and a stopband minimum attenuation of 60 dB.

clc; clear; close all;

% 1. Generate a signal (superposition of sine waves with frequencies of 10 Hz and 100 Hz)
Fs = 1000;% sampling frequency 1000Hz
t = 0: 1 / Fs: 1;
s10 = sin (20 * pi * t);% Generate 10Hz sine wave
s100 = sin (200 * pi * t);% Generate 100Hz sine wave
s = s10 + s100;% signal superposition

figure (1);% drawing
subplot (2,1,1); plot (s); grid;
title ('Original signal');

% 2. FFT analysis of signal spectrum
len = 512;
y = fft (s, len);% len point FFT transform on the signal
f = Fs * (0: len / 2-1) / len;

subplot (2,1,2); plot (f, abs (y (1: len / 2))); grid;
title ('Original signal spectrum')
xlabel ('Hz'); ylabel ('amplitude');

% 3. IIR filter design
N = 0;% order
Fp = 50;% Passband cut-off frequency 50Hz
Fc = 100;% stop band cutoff frequency 100Hz
Rp = 1;% Passband ripple maximum attenuation is 1dB
Rs = 60;% stop band attenuation is 60dB

% 3.0 Calculate the minimum filter order
na = sqrt (10 ^ (0.1 * Rp) -1);
ea = sqrt (10 ^ (0.1 * Rs) -1);
N = ceil (log10 (ea / na) / log10 (Fc / Fp));

% 3.1 Butterworth filter
Wn = Fp * 2 / Fs;
[Bb Ba] = butter (N, Wn, 'low');% Call MATLAB butter function to quickly design filter
[BH, BW] = freqz (Bb, Ba);% Draw frequency response curve
Bf = filter (Bb, Ba, s);% for low-pass filtering
By = fft (Bf, len);% len point FFT transform on signal f1

figure (2);% drawing
subplot (2,1,1); plot (t, s10, 'blue', t, Bf, 'red'); grid;
legend ('10Hz original signal', 'after Butterworth filter');
subplot (2,1,2); plot (f, abs (By (1: len / 2))); grid;
title ('Butterworth low-pass filtered signal spectrum');
xlabel ('Hz'); ylabel ('amplitude');

% 3.2 Chebyshev type I filter
[C1b C1a] = cheby1 (N, Rp, Wn, 'low');% Call MATLAB cheby1 function to quickly design low-pass filter
[C1H, C1W] = freqz (C1b, C1a);% Draw frequency response curve
C1f = filter (C1b, C1a, s);% for low-pass filtering
C1y = fft (C1f, len);% len point FFT transform on the filtered signal

figure (3);% drawing
subplot (2,1,1); plot (t, s10, 'blue', t, C1f, 'red'); grid;
legend ('10Hz original signal', 'after Chebyshev I-type filter');
subplot (2,1,2); plot (f, abs (C1y (1: len / 2))); grid;
title ('Chebyshev I-type filtered signal spectrum');
xlabel ('Hz'); ylabel ('amplitude');

% 3.3 Chebyshev type II filter
[C2b C2a] = cheby2 (N, Rs, Wn, 'low');% Call MATLAB cheby2 function to quickly design low-pass filter
[C2H, C2W] = freqz (C2b, ​​C2a);% Draw frequency response curve
C2f = filter (C2b, ​​C2a, s);% for low-pass filtering
C2y = fft (C2f, len);% Perform FFT of len point on the filtered signal

figure (4);% drawing
subplot (2,1,1); plot (t, s10, 'blue', t, C2f, 'red'); grid;
legend ('10Hz original signal', 'after Chebyshev type II filter filtering');
subplot (2,1,2); plot (f, abs (C2y (1: len / 2))); grid;
title ('Chebyshev II filtered signal spectrum');
xlabel ('Hz'); ylabel ('amplitude');

% 3.4 Ellipse filter
[Eb Ea] = ellip (N, Rp, Rs, Wn, 'low');% Call MATLAB ellip function to quickly design low-pass filter
[EH, EW] = freqz (Eb, Ea);% Draw frequency response curve
Ef = filter (Eb, Ea, s);% for low-pass filtering
Ey = fft (Ef, len);% Perform len point FFT on the filtered signal

figure (5);% drawing
subplot (2,1,1); plot (t, s10, 'blue', t, Ef, 'red'); grid;
legend ('10Hz original signal', 'after ellipse filter filtering');
subplot (2,1,2); plot (f, abs (Ey (1: len / 2))); grid;
title ('Ellipse filtered signal spectrum');
xlabel ('Hz'); ylabel ('amplitude');

% 3.5 yulewalk filter
fyule = [0 Wn Fc * 2 / Fs 1];% Here is a simple design, the actual need multiple simulations to get the best value
myule = [1 1 0 0];% here is a simple design, the actual need for multiple simulations to get the best value
[Yb Ya] = yulewalk (N, fyule, myule);% Call MATLAB yulewalk function to quickly design low-pass filter
[YH, YW] = freqz (Yb, Ya);% Draw frequency response curve
Yf = filter (Yb, Ya, s);% for low-pass filtering
Yy = fft (Yf, len);% len point FFT transform on the filtered signal

figure (6);% drawing
subplot (2,1,1); plot (t, s10, 'blue', t, Yf, 'red'); grid;
legend ('10Hz original signal', 'after filtering by yulewalk filter');
subplot (2,1,2); plot (f, abs (Yy (1: len / 2))); grid;
title ('yulewalk filtered signal spectrum');
xlabel ('Hz'); ylabel ('amplitude');

% 4. Comparative analysis of the amplitude-frequency response of each filter
A1 = BW * Fs / (2 * pi);
A2 = C1W * Fs / (2 * pi);
A3 = C2W * Fs / (2 * pi);
A4 = EW * Fs / (2 * pi);
A5 = YW * Fs / (2 * pi);

figure (7);% drawing
subplot (1, 1, 1); plot (A1, abs (BH), A2, abs (C1H), A3, abs (C2H), A4, abs (EH), A5, abs (YH)); grid;
xlabel ('frequency / Hz');
ylabel ('frequency response amplitude');
legend ('butter', 'cheby1', 'cheby2', 'ellip', 'yulewalk');