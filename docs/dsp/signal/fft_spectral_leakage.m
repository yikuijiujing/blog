clear;clf;

T = 0.10
Fs=10240; t = 0:1/Fs:(T-1/Fs);    
% x(t)=\frac{1}{3}(sin(40*2*\pi*t)+sin(160*2*\pi*t)+sin(320*2*\pi*t))
x = (2*sin(40*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;
y = (2*sin(37.5*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;  % 在T时刻第一项不为Pi整数，值不�?0
z = (2*sin(35*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;

N = length(x);
M = 2048

f = 0:Fs/N:Fs-Fs/N;
F = 0:Fs/M:Fs-Fs/M;
X = fft(x);
Xext = fft(x, M);

subplot(212); plot(f, abs(fft(X)), F, abs(fft(Xext))); 
legend('perfect', 'leaked'); grid on



