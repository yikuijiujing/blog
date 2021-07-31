# DC Block



待测函数为 
$$
x(t) = \sin(2\pi*2*t)+\sin(2\pi*20*t)+\sin(2\pi*200*t)+\sin(2\pi*2000*t);
$$
使用Matlab进行滤波处理

```
function y = DCBlock ( x, c )  % c - coefficient  
    b = [1, -1];  % filter coefficient b  
    a = [1, -c];  % filter coefficient a  
    y = filter (b,a,x);
end
```

滤波效果

![](C:\Work\blog\docs\dsp\filters\high_pass_filters\sine_2hz_20hz_200hz_2khz_fc_350hz_dcblock_matlab.png)

