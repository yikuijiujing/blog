clear; clf;

N=1024;
a = 0.5

t = 0:N-1;
t = t - N/2;
##x_hann = hann(N);
##X_hann = fftshift(fft(x_hann)/N);
##plot(t, 20*log10(abs(X_hann))); hold on
##
##x_hamming = hamming(N);
##X_hamming = fftshift(fft(x_hamming)/N);
##plot(t, 20*log10(abs(X_hamming))); hold on


set(gca, 'xLim', [-60, 60])