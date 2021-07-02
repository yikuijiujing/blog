function [t, harmonics_sum] = square_approximation(N, Fs)
  ## f = 1
  T = 1
  w = 2*pi/T

  t = [-T/2:T/Fs:T/2-T/Fs];
  ## 方波的傅里叶级数展开式
  ## x = 4/pi*(sin(w*t)+sin(3*w*t)/3+sin(5*w*t)/5+...+sin((2n-1)*w*t)

  harmonics = zeros(N, length(t));

  for n = 1:N
      harmonics(n,:) = 4/pi*sin((2*n-1)*w*t)/(2*n-1);
  end

  harmonics_sum = zeros(1, length(t));
  for n = 1:N
    harmonics_sum = harmonics_sum + harmonics(n,:);

end

