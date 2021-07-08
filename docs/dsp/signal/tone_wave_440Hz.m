Fs=16000;
fileId = fopen('c:/users/lantu.xu/desktop/tone_wave.pcm','r');
x = fread(fileId,inf,'int32');
% sound(x,Fs);
% r = 0x7fffffffs32  % 2147483647
x = x/2147483647;

n = length(x);              % number of samples
N = 2^nextpow2(n);          % number of FFT samples

figure(1)
subplot 221; plot(x(1:100)); title("Wave Head"); grid on
subplot 222; plot(N-100:N, x(N-100:N)); title("Wave End"); grid on

y = fft(x, N);
%  y = y/max(y);               % normalize
y = fftshift(y);
power = 20*log10(abs(y)*2/N);
f = (0:N-1)*(Fs/N)-Fs/2;    % frequency range
subplot(223); plot(f, power);title("Shifted Spectrum");grid on
subplot(224); semilogx(f(N/2+1:N), power(N/2+1:N));
title("Spectrum");grid on

% the top 3 frequency
[p, i] = sort(power, 'descend');
top10 = i(1:10);
top5_freq = (top10(find(top10>N/2))-N/2)*Fs/N

%% Compare to audacity spectrum analysis graph

figure(2)
% Hann Window
win = hann(512);
i=(floor(length(y)/512)-1)*2; % 因为分帧计算，这里计算循环次数。因为要50%的重叠，所以需要乘以2

xwin=zeros(1,N);            % 初始化函数
ywin=zeros(1,N);            % 
xifft=zeros(1,N);           % 初始化函数

% X = x.*win';
% X = X/max(X);

for a =0:i
    StartPoint=1+256*a;            
    x0(1:512)=x(StartPoint:(StartPoint+512-1)); %取每次要处理的512个数据
    x0=x0.*win';                % 加窗
    TempData=fft(x0);               % 做FFT计算
    Xifft=ifft(TempData);           % MATLAB自带IFFT函数
    xifft(StartPoint:StartPoint+512-1) = xifft(StartPoint:StartPoint+512-1)+Xifft;    %重组
    xwin(StartPoint:StartPoint+512-1) = xwin(StartPoint:StartPoint+512-1)+x0;  %
    ywin(StartPoint:StartPoint+512-1) =  ywin(StartPoint:StartPoint+512-1)+ TempData/256;
end

subplot 221; plot(1:400, x(1:400), 1:400, xwin(1:400));title("Windowed Wave");grid on
subplot(222); plot(N-400:N, x(N-400:N), N-400:N, xwin(N-400:N));title("Windowed Wave");grid on
Y1 = fft(xwin);
Y = fftshift(Y1);
Power = 20*log10(abs(Y)*2/N);
subplot(223); semilogx(f(N/2+1:N), Power(N/2+1:N));title("Spectrum");grid on
X1 = ifft(Y1, N);
subplot(224); semilogx((1:512)*(Fs/N), abs(ywin(1:512)));

