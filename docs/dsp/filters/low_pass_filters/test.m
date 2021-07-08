% [t, x] = square_approximation(20, 40);
% lpf(x, 5, 6, -3, 3, 20)


m = [1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0];
f = linspace(0,1,20);
[b,a] = yulewalk(2,f,m);
b
a

freqz(b,a)
