m = [1 1 1 1 1 1 1 1 1 1 0.7 0.3 0 0 0 0 0 0 0 0];
f = linspace(0,1,20);
[b,a] = yulewalk(2,f,m);

% b=[0.3168    0.5562    0.3191];
% a=[1.0000   -0.0300    0.2236];

sysd = filt(b, a, 0.1)
sys = d2c(sysd)

w = logspace(-1,1,1000);
% ##      0.3168 s^2 - 0.6401 s + 2.926
% ## y1:  -----------------------------
% ##          s^2 - 1.498 s + 2.93
h = freqs([0.3168, -0.6401, 2.926], [1,-1.498, 2.93], w);
semilogx(w,abs(h)), grid
xlabel('Frequency (rad/s)')
ylabel('Magnitude')