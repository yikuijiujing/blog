N = 256;
subplot(4,4,1); plot(bartlett(N)); title('bartlett')
subplot(4,4,2); plot(barthannwin(N)); title('barthannwin')
subplot(4,4,3); plot(blackman(N)); title('blackman')
subplot(4,4,4); plot(blackmanharris(N)); title('blackmanharris')
subplot(4,4,5); plot(bohmanwin(N)); title('bohmanwin')
subplot(4,4,6); plot(chebwin(N)); title('chebwin')
subplot(4,4,7); plot(flattopwin(N)); title('flattopwin')
subplot(4,4,8); plot(gausswin(N)); title('gausswin')
subplot(4,4,9); plot(hamming(N)); title('hamming')
subplot(4,4,10); plot(hann(N)); title('hann')
subplot(4,4,11); plot(kaiser(N)); title('kaiser')
subplot(4,4,12); plot(nuttallwin(N)); title('nuttallwin')
subplot(4,4,13); plot(parzenwin(N)); title('parzenwin')
subplot(4,4,14); plot(rectwin(N)); title('rectwin')
subplot(4,4,15); plot(triang(N)); title('triang')
subplot(4,4,16); plot(tukeywin(N)); title('tukeywin')

figure(2);
plot_window_func(2,1,'hann', hann(N), N)

function [] = plot_window_func(m, n, name, data, N)
    subplot(m, 3*n, 3*(n-1)+1); plot(data); title(name);
    y = fft(data);
    amplitude = abs(y);
%     amplitude = 20*log10(amplitude/N);
%     amplitude = amplitude/max(amplitude);
    subplot(m, 3*n, 3*(n-1)+2); plot(amplitude); 
end

