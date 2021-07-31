clf; clear all; 

fs = 16000;
fc = [3.5*2*pi, 35*2*pi, 350*2*pi, 3500*2*pi];
sys = cell(1, length(fc));
sys_z = cell(1, length(fc));
gothrough = tf([0.707, 0], [1, 0])
bodeplot(gothrough); hold on;
for i=1:length(fc)
    sys{i} = tf([1, 0], [1, fc(i)]);
    sys_z{i} = c2d(sys{i}, 1/fs);
    h = bodeplot(sys{i}); hold on;
end
% setoptions(h,'FreqUnits','Hz','PhaseVisible','off');
p = getoptions(h); 
p.PhaseVisible = 'off'; 
p.Ylim = [-60, 5];
% p.XLabel.String = '频率';
p.FreqUnits = 'Hz';
% p.YLabel.String = '幅值';
p.Title.String = '一阶高通滤波的幅值与截至频率';
p.grid = 'on';
% p.InputLabels = {'3.5', '35', '350', '3500'};
setoptions(h,p);

fc_z = zeros(1, length(fc));
for i=1:length(fc)
    fc_z(i) = - sys_z{i}.Denominator{1}(2);
end
% 0.9986    0.9863    0.8716    0.2530
fc_z
% 0.9986    0.9864    0.8792    0.4212
r = fc/fs + 1;
r = 1./r