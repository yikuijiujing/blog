N = 64;

% subplot(4,4,1); plot(rectwin(N), 'r'); hold on
% plot(triang(N), 'g'); 
% plot(bartlett(N), 'b'); 
% legend('rectwin', 'triang', 'bartlett')
% title('直线折线窗')
% fig = wvtool(rectwin(N), triang(N), bartlett(N), barthannwin(N))

% fig2 = wvtool(hann(N), hamming(N), blackman(N), blackmanharris(N), nuttallwin(N), flattopwin(N)); 


% subplot(4,4,5); plot(bohmanwin(N)); title('bohmanwin')
wvtool(chebwin(N), flattopwin(N), kaiser(N, 5))
% subplot(4,4,7); plot(flattopwin(N)); title('flattopwin')
% subplot(4,4,8); plot(gausswin(N)); title('gausswin')
% 
% subplot(4,4,11); plot(); title('kaiser')
% subplot(4,4,13); plot(parzenwin(N)); title('parzenwin')
% 
% subplot(4,4,16); plot(tukeywin(N)); title('tukeywin')
% 
% figure(2);
% plot_window_func(2,1,'hann', hann(N), N)

function [] = plot_window_func(m, n, name, data, N)
    subplot(m, 3*n, 3*(n-1)+1); plot(data); title(name);
    y = fft(data);
    amplitude = abs(y);
%     amplitude = 20*log10(amplitude/N);
%     amplitude = amplitude/max(amplitude);
    subplot(m, 3*n, 3*(n-1)+2); plot(amplitude); 
end

