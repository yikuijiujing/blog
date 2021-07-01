##
t_max = 20;

f=9/10;
t=0:1/f/100:t_max;
##x = 2*sin(2*pi*f*t);
f3=3/10;
x = sin(2*pi*f*t)+sin(2*pi*f3*t);

fs=1;
ts = 0:1/fs:t_max-1/fs;
##xs = 2*sin(2*pi*f*ts);
xs = sin(2*pi*f*ts)+sin(2*pi*f3*ts);

fig1 = figure(1)
## 对图形的位置及大小进行设置。单位为厘米，大小为20cm×4cm，
## 图形起点坐标为（1cm，1cm）表示左下点离显示器左侧边界1cm，
## 离下侧边界1cm。
set(gcf, 'unit', 'centimeters', 'position', [1 1 20 4])
set(gca,'FontSize',8);

plot(t, x, 'r-;orignal wave;', ts, xs, '-b*;sample wave;')
h1=legend()
set(h1,'Orientation','horizon','Box','off')
## 分开画图
##plot(t, x, 'r-')
##hold on
##plot(ts, xs, '-b*')
##legend('Orignal Wave', 'Sampled Wave')
##set(gca,'ygrid','on')
grid on
axis equal
set(gca, 'XTick', 0:1:t_max)
set(gca, 'YTick', -2:1:2)
axis([0 t_max -2 2])
## 保存图片
saveas(gcf, 'alias.png')
close(fig1)

#### 估计有频率泄露，待确认
##y = fft(x);
##n = length(x);          % number of samples
##fr = (0:n-1)*(fs/n);     % frequency range
##power = abs(y).^2/n;    % power of the DFT
##plot(fr, power, 'r')
##hold on

ys = fft(xs)
n = length(xs);          % number of samples
fr_s = (0:n-1)*(fs/n);     % frequency range
power_s = abs(ys);    % power of the DFT

fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(ys);
power_shift = abs(yshift);

fig2 = figure(2)
set(gcf, 'unit', 'centimeters', 'position', [1 1 10 4])
set(gca,'FontSize',8);
plot(fr_s, power_s, '-;orignal;', 
    ## fshift, power_shift, '-;shfit;',
    [fs/2, fs/2], [0, 100])

set(gca,'XLim',[0 1]) %X轴的数据显示范围
set(gca,'XTick',[0:0.1:1]) %设置要显示坐标刻度
##set(gca,'XTickLabel',[0:0.1:1]);%给坐标加标签 
set(gca,'YLim',[0 30]) %X轴的数据显示范围
##axis([0 1. 0 100])
xlabel('Frequency')
ylabel('Amplitude')
h1=legend()
set(h1,'Orientation','horizon','Box','off')
##annotation('textarrow',[0.7 0.55],[0.5 0.5], 'String', '\fontsize{10}x=f_s/2');
##text(fs/2, 10,'x=f_s/2');
text(fs/2, 10,'x=f_s/2');

saveas(gcf, 'spectrum.png')
close(fig2)