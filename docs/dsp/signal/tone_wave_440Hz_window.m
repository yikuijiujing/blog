clear()

Fs=16000;
fileId = fopen('c:/users/lantu.xu/desktop/tone_wave.pcm','r');
x = fread(fileId,inf,'int32');
% sound(x,Fs);
% r = 0x7fffffffs32  % 2147483647
x = x(1:1024)/2147483647;  % the origal data has 8092 points, too much to plot

n = length(x);              % number of samples
N = 2^nextpow2(n);          % number of FFT samples
f = (0:N-1)*(Fs/N);    % frequency range

y = fft(x, N);
power = 20*log10(abs(y)*2/N);

% Hann Window
win = hann(512);
i=(floor(length(y)/512)-1)*2; % 因为分帧计算，这里计算循环次数。因为要50%的重叠，所以需要乘以2

xwin=zeros(1,N);            % 初始化函数
ywin=zeros(1,N);            % 
xifft=zeros(1,N);           % 初始化函数

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

subplot 211; 
plot(1:N, x, 1:N, xwin, 1:N, xifft*0.9); % *0.9 作图对比用
legend({'orignal', 'windowed', 'ifft'})
title("波形比较");grid on

Y = fft(xwin);
Power = 20*log10(abs(Y)*2/N);
subplot(212); semilogx(f, power, f, Power); legend({'orignal', 'windowed'})
title("频谱比较");grid on
% X1 = ifft(Y1, N);
% subplot(224); semilogx((1:512)*(Fs/N), abs(ywin(1:512)));

