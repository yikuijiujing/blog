### IIR滤波器比较

<table>
<tr><th>类型</th><th>设计函数</th><th>图像</th><th></th>备注</tr>
<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/besself.html">Bessel</a>（仅模拟）</td>
<td>
[b,a] = besself(n,Wn,options)
[z,p,k] = besself(n,Wn,options)
[A,B,C,D] = besself(n,Wn,options)


</td>
<td> <img src=bessel_proto.png/>
</td>
<td>模拟 Bessel 低通滤波器在零频率处具有最大平坦度的群延迟，并且在整个通带内保持几乎恒定的群延迟。因此，滤波后的信号在通带频率范围内保持其波形。当模拟 Bessel 低通滤波器通过频率映射转换为数字滤波器时，它不再具有这种最大平坦属性。Signal Processing Toolbox™ 仅支持使用完整 Bessel 设计函数实现模拟滤波器。

相比其他滤波器，Bessel 滤波器通常需要更高的阶数才能获得理想的阻带衰减。在 Ω = 1 处 |H(jΩ)|<1/sqrt(2)，并且会随着滤波器阶数 n 的增大而减小。
</td>
</tr>

<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/butter.html">Butterworth</a></td>
<td>
[b,a] = butter(n,Wn,options)
[z,p,k] = butter(n,Wn,options)
[A,B,C,D] = butter(n,Wn,options)


</td>
<td><img src=butter_proto.png/></td>
<td>Butterworth 滤波器提供理想低通滤波器在模拟频率 Ω  = 0 和 Ω = ∞ 处的响应的最佳泰勒级数逼近；对于任意阶 N，幅值平方响应在这两个位置的 2N – 1 阶导数为零（即在 Ω = 0 和 Ω = ∞ 处达到最大平坦）。总体而言，响应呈单调形态，从 Ω = 0 到 Ω = ∞ 平稳下降。在 Ω = 1 处，|H(jΩ)|=1/G
2
。
</td>
</tr>

<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/cheby1.html">Chebyshev I 类</a></td>
<td>
[b,a] = cheby1(n,Rp,Wn,options)
[z,p,k] = cheby1(n,Rp,Wn,options)
[A,B,C,D] = cheby1(n,Rp,Wn,options)


</td>
<td><img src=cheb1ap_proto.png/>
</td>
<td>Chebyshev I 类滤波器通过在通带中引入 Rp dB 的等波纹，将整个通带的理想和实际频率响应之间的绝对差降至最低。其阻带响应达到最大平坦度。从通带到阻带的过渡比 Butterworth 滤波器更快。在 Ω = 1 处，|H(jΩ)|=10^−Rp/2。
</td>
</tr>

<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/cheby2.html">Chebyshev II 类</a></td>
<td>
[b,a] = cheby2(n,Rs,Wn,options)
[z,p,k] = cheby2(n,Rs,Wn,options)
[A,B,C,D] = cheby2(n,Rs,Wn,options)


</td>
<td><img src=cheb2ap_proto.png/></td>
<td>Chebyshev II 类滤波器通过在阻带中加入 Rs dB 的等波纹，将整个阻带的理想频率响应和实际频率响应之间的绝对差降至最低。其通带响应达到最大平坦度。

阻带不像 I 类滤波器那样快地逼近零（对于偶数滤波器阶 n 则根本不会逼近零）。然而，通带中没有波纹通常是重要优势。在 Ω = 1 处，H(jΩ)=10
−Rs/20
。


</td>
</tr>

<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/ellip.html">椭圆</a></td>
<td>
[b,a] = ellip(n,Rp,Rs,Wn,options)
[z,p,k] = ellip(n,Rp,Rs,Wn,options)
[A,B,C,D] = ellip(n,Rp,Rs,Wn,options)
</td>
<td><img src=ellipap_proto.png/></td>
<td>椭圆滤波器在通带和阻带中均采用等波纹。它们通常以任何支持的滤波器类型中的最低阶满足滤波器要求。在给定滤波器阶数 n、以分贝为单位的通带波纹 Rp、以分贝为单位的阻带波纹 Rs 的情况下，椭圆滤波器可以最小化过渡宽度。在 Ω = 1 处，|H(jΩ)|=10^−Rp/20。
</td>
</tr>

<tr>
<td><a href="https://ww2.mathworks.cn/help/signal/ref/yulewalk.html">Yulewalk</a></td>
<td>
[b,a] = yulewalk(n,f,m)
</td>
<td>
</td>
<td>这些方法基于离散域中的设定设计滤波器。与模拟原型方法不同，直接设计方法不受标准低通、高通、带通或带阻配置的约束。相反，这些函数设计的滤波器具有任意（也许是多频带）频率响应。

yulewalk 函数通过拟合指定的频率响应来设计递归 IIR 数字滤波器。yulewalk 的名称反映其求滤波器分母系数的方法：它求理想的指定幅值平方响应的逆 FFT，并使用所得的自相关函数样本求解修正的 Yule-Walker 方程。以下语句

请注意，yulewalk 不接受相位信息，也不对最终滤波器的最佳性做出声明。
</td>
</tr>


所有经典的 IIR 低通滤波器都不适用于极低的截止频率。因此，与其设计通带非常窄的低通 IIR 滤波器，不如设计更宽的通带并抽取输入信号。