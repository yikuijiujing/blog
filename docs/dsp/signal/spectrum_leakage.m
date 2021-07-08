
%% 将正弦波做FFT计算，50%的重叠。验证IFFT的计算——对比自带函数IFFT函数，和对FFT结果取共轭，再进行FFT计算的区别。
clear;clf;
Fs=24000;t = 0:1/Fs:0.07;y=sin(200*2*pi*t+50);      % 24k采样率下，生成200Hz、0.07秒正弦波
i=(floor(length(y)/512)-1)*2;                       % 因为分帧计算，这里计算循环次数。因为要50%的重叠，所以需要乘以2
yfft=zeros(1,length(y));            % 初始化函数
yifft=zeros(1,length(y));           % 初始化函数
Windows=hamming(512);               % 取窗函数
for a =0:i
    StartPoint=1+256*a;            
    y0(1:512)=y(StartPoint:(StartPoint+512-1)); %取每次要处理的512个数据
    y0=y0.*Windows';                % 加窗
    TempData=fft(y0);               % 做FFT计算
    Yifft=ifft(TempData);           % MATLAB自带IFFT函数
    Yfft=conj(TempData);            % 取共轭复数
    Yfft=fft(Yfft);                 % 虚部取反做FFT计算
    Yfft=(real(Yfft)/512)*0.98;     % 取出实部，并对其除以N。乘以0.98为了做图进行对比
    yfft(StartPoint:StartPoint+512-1)=yfft(StartPoint:StartPoint+512-1)+Yfft;       %重组
    yifft(StartPoint:StartPoint+512-1)=yifft(StartPoint:StartPoint+512-1)+Yifft;    %重组
end
%% 作图
figure(1);
plot(y,'*');            hold on
plot(yfft,'r');         hold on ;
plot(yifft,'k');        grid on
legend('原信号时域','虚部取反做fft时域','Ifft时域');
xlabel('时域（t）');
ylabel('幅值');
