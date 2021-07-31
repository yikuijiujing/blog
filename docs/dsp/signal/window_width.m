fs = 128;
t1 = 0:10/fs:(10-10/fs);
x1 = cos(2*pi*t1);
t2 = 10:10/fs:(20-10/fs);
x2 = cos(6*pi*t2);
t3 = 20:10/fs:(30-10/fs);
x3 = cos(4*pi*t3);

t = [t1, t2, t3];
x = [x1, x2, x3];

win16 = hann(16);
win32 = hann(32);
win64 = hann(64);
win128 = hann(128);

subplot(221); specgram(x, 16, fs, win16); title('Fs=128, B=16')
subplot(222); specgram(x, 32, fs, win32); title('Fs=128, B=32')
subplot(223); specgram(x, 64, fs, win64); title('Fs=128, B=64')
subplot(224); specgram(x, 128, fs, win128); title('Fs=128, B=128')

figure(2)
subplot(221); stft(x, fs, 'Window', win16, 'FFTLength', 16); title('Fs=128, B=16')
subplot(222); stft(x, fs, 'Window', win32, 'FFTLength', 32); title('Fs=128, B=32')
subplot(223); stft(x, fs, 'Window', win64, 'FFTLength', 64); title('Fs=128, B=64')
subplot(224); stft(x, fs, 'Window', win128, 'FFTLength', 128); title('Fs=128, B=128')