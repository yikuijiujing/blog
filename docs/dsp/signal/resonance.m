clear;clf;

T = 0.10
Fs=10240; t = 0:1/Fs:T;      % 24k采样率下，生�?0.01秒正弦波
% x(t)=\frac{1}{3}(sin(40*2*\pi*t)+sin(160*2*\pi*t)+sin(320*2*\pi*t))
x = sin(40*2*pi*t);
y = sin(35*2*pi*t);

plot(t, x, t, y, t, x+y); grid on
lgd=legend('x-40', 'y-37.5', 'x+y');

