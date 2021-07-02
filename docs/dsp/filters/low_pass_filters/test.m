##[t, x] = square_approximation(20, 40);
##
##lpf(x, 5, 6, -3, 3, 20)


m = [1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0];
f = logspace(-1,1,20);
length(m)
length(f)
[b,a] = yulewalk(2,f,m);
[h,w] = freqz(b,a,128)
plot(f,m,w/pi,abs(h))