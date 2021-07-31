
M=63;%所需频率采样点个数
Wp=0.5*pi;%通带截止频率
m=0:(M+1)/2;%通频带上的采样点
Wm=2*pi*m./(M+1);%阻带截止频率
mtr=floor(Wp*(M+1)/(2*pi))+2;
%向负方向舍入floor(3.5)=3;floor(-3.2)=-4
Ad=[Wm<=Wp];
Ad(mtr)=0.38;
Hd=Ad.*exp(-j*0.5*M*Wm);%构造频域采样向量H(k)
Hd=[Hd conj(fliplr(Hd(2:(M+1)/2)))];%fliplr函数实现矩阵的左右翻转conj是求复数的共轭
h=real(ifft(Hd));%h（n）=IDFT[H(k)]
w=linspace(0,pi,1000);%用于产生0,pi之间的1000点行矢量
H=freqz(h,[1],w);%滤波器的幅频特性图
figure(2)
plot(w/pi,20*log10(abs(H)));%参数分别是归一化频率与幅值
xlabel('归一化角频率');
ylabel('增益/分贝');
axis([0 1 -50 0.5]);
