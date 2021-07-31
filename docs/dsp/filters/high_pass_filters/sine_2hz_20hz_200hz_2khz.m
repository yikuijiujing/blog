fs = 16000;

t = 0:1/fs:1.0;
% sine_2hz_20hz_200hz_2khz
x = sin(2*pi*2*t)+sin(2*pi*20*t)+sin(2*pi*200*t)+sin(2*pi*2000*t);
x = x/4.0;

tmp = x.*65535*65535/2;

fid = fopen('sine_2hz_20hz_200hz_2khz.pcm', 'wb'); 
fwrite(fid, tmp, 'int32');

audiowrite('sine_2hz_20hz_200hz_2khz.wav', x, fs);

N = 2^nextpow2(length(x)); 
X = abs(fft(x))*2/N;
[pks,locs] = findpeaks(X(1:N/2));

f = 1:N/2;
f = f*fs/N;

subplot(211); plot(f, X(1:N/2)); hold on; scatter(locs*fs/N, pks);
set(gca,'xscale','log'); title('Before DC Block');

y = DCBlock(x, 0.8712);
Y = abs(fft(y))*2/N;
audiowrite('sine_2hz_20hz_200hz_2khz_fc_350hz.wav', y(1:N/2), fs);

[pks,locs] = findpeaks(Y(1:N/2));
subplot(212); plot(f, Y(1:N/2)); hold on; scatter(locs*fs/N, pks);
scatter([350], [0.25*0.707], '*'); text(350, 0.25*0.707+0.02, 'cutoff')
set(gca,'xscale','log'); title('After DC Block');

fig = figure(2);
% [mag, phase] = freqz(b,a,'whole', fs);
% power = abs(mag).^2;
% dB3 = interp1(power(1:N/2), mag(1:N/2), 0.5);
% semilogx(power);

sys_z = tf([1,-1], [1, -0.8712], 1/fs);
sys = d2c(sys_z);
[mag,phase,wout] = bode(sys);   % Get Plot Data
mag = squeeze(mag);             % Reduce (1x1xN) Matrix To (1xN)
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;      % Calculate Power Of Ratio Of ‘mag/max(mag)’
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');  % Find Frequency & Phase & Amplitude of Half-Power (-3 dB) Point
semilogx(wout/2/pi, mag, '--', dB3(1)/2/pi, dB3(3), '-*');
str_e = sprintf('Cutoff(%0.2f, %0.2f)', dB3(1)/2/pi, dB3(3))
text(dB3(1)/2/pi, dB3(3), str_e);

function y = DCBlock ( x, c )  % c - coefficient  
    b = [1, -1];  % filter coefficient b  
    a = [1, -c];  % filter coefficient a  
    y = filter (b,a,x);
end




   
