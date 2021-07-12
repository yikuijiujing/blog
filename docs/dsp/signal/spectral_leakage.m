clear;clf;

T = 0.10
Fs=10240; t = 0:1/Fs:T-1/Fs;      % 24k采样率下，生成0.01秒正弦波
% x(t)=\frac{1}{3}(sin(40*2*\pi*t)+sin(160*2*\pi*t)+sin(320*2*\pi*t))
x = (2*sin(40*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;
y = (2*sin(37.5*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;  % 在T时刻第一项不为Pi整数，值不为0
z = (2*sin(35*2*pi*t)+sin(160*2*pi*t)+sin(320*2*pi*t))/4;

N = length(x);
% 检查实际数据确认是否泄露
X = abs(fft(x));
X(find(X>0.0001))

% 快速傅里叶变换引入的泄露
X = abs(fft(x, 2*N)/2/N);
f = 0:Fs/2/N:Fs-Fs/2/N;
semilogx(f, X);

%%

X=zeros(1,N);           % 初始化函数
Y=zeros(1,N);           % 初始化函数


figure(1)

subplot(211); plot(t, x, '-', t, y, '-', t, z, '-'); legend('pefect', 'leaked', 'leaked2'); grid on
subplot(212); semilogx(f, abs(fft(x)), f, abs(fft(y)), f, abs(fft(z))); 
legend('perfect', 'leaked', 'leaked2'); grid on

wvtool(y)
wvtool(z)

%% 加窗

M = 256
i=(floor(length(y)/M)-1)*2;      % 因为分帧计算，这里计算循环次数。因为要50%的重叠，所以需要乘以2
Window=hamming(M);               % 取窗函数
for a =0:i
    start=1+a*M/2;
    x0=x(start:(start+M-1)); %取每次要处理的M/2个数据
    y0=y(start:(start+M-1)); 
    x0=x0.*Window';                % 加窗
    y0=y0.*Window';                
    X(start:start+M-1)=X(start:start+M-1)+x0;       %重组
    Y(start:start+M-1)=Y(start:start+M-1)+y0;       %重组
end

figure(2)
f = 0:Fs/N:Fs-Fs/N;
subplot(221); plot(t, x, t, X); legend('orignal', 'windowed'); grid on
subplot(222); semilogx(f, abs(fft(x)), f, abs(fft(X))); 
legend('orignal', 'windowed'); grid on
subplot(223); plot(t, y, t, Y); legend('orignal', 'windowed'); grid on
subplot(224); semilogx(f, abs(fft(y)), f, abs(fft(Y)));
legend('orignal', 'windowed'); grid on

wvtool(x)
wvtool(X)
% figure(3)
wvtool(y)
wvtool(Y)

