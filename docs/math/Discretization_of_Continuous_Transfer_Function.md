离散化的方法有很多：前向差分；后向差分；tustin；零极点匹配；脉冲响应；阶跃响应；

控制器设计的时候多采用tustin，后向差分，零极点配置等；滤波器设计常用脉冲响应不变法。

matlab的c2d命令提供了五种离散的方法：
1. zoh 零阶保持器法,默认的就是这个。
2. foh 一阶保持器法
3. tustin 双线性变换法
4. impulse 脉冲响应法
5. matched 零极点匹配法



##### 前向差分
方法是用一阶前向差分近似替代微分，用矩形面积之和近似替代数值积分；特点是近似关系简单，稳态增益不变，但稳定性可能会改变，且一般不用此种方法。

##### 后向差分
和前向差分很相似，不过是用一阶后向差分来代替；特点：近似关系简单，稳态增益不变，稳定性不变，一对一映射关系（无频率混叠），但高频段畸变严重，采样频率越大，频率特性越好。

##### 双线性（Tustin）变换
方法是用梯形面积取代数值积分；特点和后向差分类似。但线性范围比后向差分要大。

已知z域和s域的关系为 $z=e^{sT}$，但是这种方式会造成频谱的混叠。重写该公式
$z=e^{sT}=\frac{e^{sT/2}}{e^{-sT/2}}$
在原点sT/2=0处对上式进行泰勒展开,并砍去高阶项，很容易得到
$z\approx\frac{1+sT/2}{1-sT/2}$
最终得到对应关系
$s=\frac{2}{T}\frac{1-z^{-1}}{1+z^{-1}} \quad\text{和}\quad z=\frac{1+sT/2}{1-sT/2}$
由于分子和分母都是s的线性关系，所以这个式子就叫双线性变换。

##### 零极点匹配法
映射关系为z变换，稳定性不变，频率混叠，没有畸变。

##### 脉冲响应不变法和阶跃响应不变法（零阶保持器法）
多对一变换，频率混叠；稳态增益改变（工程意义不大，不用于控制器设计）




链接：
* [连续传递函数离散化](https://blog.csdn.net/qq_34473360/article/details/100168842)
* [双线性变换法详解](https://zhuanlan.zhihu.com/p/265965580)



