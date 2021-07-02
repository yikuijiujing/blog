clear; clc

T = 1
w = 2*pi/T
N = 30

t = [-0.5:0.025:0.5];
## 方波的傅里叶级数展开式
## x = 4/pi*(sin(w*t)+sin(3*w*t)/3+sin(5*w*t)/5+...+sin((2n-1)*w*t)

harmonics = zeros(10, length(t));

for n = 1:N
    harmonics(n,:) = 4/pi*sin((2*n-1)*w*t)/(2*n-1);
end

harmonics_sum = zeros(1, length(t));
for n = 1:N
  n
  harmonics_sum = harmonics_sum + harmonics(n,:);
  switch n
    case {1, 3, 7, 15, 30}
      label = sprintf(';n=%d;', n);
      plot(t, harmonics_sum, label)
      hold on
  otherwise
    ;
  endswitch
end
legend
