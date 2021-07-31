#### 一阶高通滤波器公式推导
这是RC电路实现的一阶高通滤波器

![avatar](1_order_RC.png)

根据串联电路电流相等
$\frac{dC(x(t)-y(t))}{dt}=\frac{y(t)}{R}$

可得到微分方程
$y(t)+RC\frac{dy(t)}{dt}=RC\frac{dx(t)}{dt}\qquad(1)$

两边进行拉普拉斯变换
$Y(s)+RC\cdot sY(s)=RC\cdot sX(s)$

得到传递函数
$H(s)=\frac{Y(s)}{X(s)}=\frac{RCs}{RCs+1}=\frac{s}{s+\frac{1}{RC}} \qquad(2)$


把微分方程按照后向差分进行离散
$y(n)+RC\frac{y(n)-y(n-1)}{T}=RC\frac{x(n)-x(n-1)}{T}$

整理后为
$y(n)=\frac{RC}{RC+T}y(n-1)+\frac{RC}{RC+T}(x(n)-x(n-1)) \qquad(3)$

对两边进行Z变换
$Y(n)=\frac{RC}{RC+T}Y(n)z^{-1}+\frac{RC}{RC+T}(X(n)-X(n)z^{-1})$

化简得离散格式的传递函数
$H(z)=\frac{Y(n)}{X(n)}=\frac{1-z^{-1}}{\frac{RC+T}{RC}-z^{-1}}=\frac{z-1}{\frac{RC+T}{RC}z-1} \qquad(4)$

在计算(3)的过程中，使用的一阶后向差分，是导数的一个近似，所以它们都是真正传递函数的近似函数，不是精确值，好处是实际计算中方便，也能帮助理解为什么Z域传递函数中总有$z^{-1}$。

再来看一下离散格式的真实函数，根据离散Z变换$z=e^{sT}$，也就是$s=\frac{\ln z}{T}$，带入(2)，得到
$H(z)=\frac{\ln z}{\ln z + \frac{T}{RC}}$
通常看到的有理函数都是它的近似。另外也能看到它跟s域的传递函数是不可能一样的。

[一阶高通滤波器_WJsuperrunner-CSDN博客](https://blog.csdn.net/superrunner_wujin/article/details/73526409?locationNum=3&fps=1)

#### 截至频率

高通滤波器的传递函数为 $H(s)=\frac{s}{s+\frac{1}{RC}}\equiv \frac{s}{s+\tau}$和 $H(z)=\frac{RC}{RC+T}\cdot\frac{1-z^{-1}}{1- \frac{RC}{RC+T}z^{-1}}$

下面计算截至频率和相角

$H(j\omega)=\frac{j\omega}{j\omega+\tau}=\frac{j\omega(\tau-j\omega)}{(j\omega+\tau)(\tau-j\omega)}=\frac{\omega^2}{\tau^2+\omega^2}+j\frac{\omega\tau}{\tau^2+\omega^2}$



$A^2(\omega)=\frac{\omega^2}{\omega^2+\tau^2}$

$\Omega(\omega)=arctan(\frac{\tau}{\omega})$

截至频率的点$A^2(\omega)=\frac{1}{2}$，即 $\omega=\tau$，此时$\Omega(\tau)=\frac{\pi}{4}$