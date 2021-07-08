线性预测器(Linear Predictor)

$$\hat{x}_n=−a_n x_{n−1}−a_3 x_{n−2}−\cdots−a_{p+1}x_{n−p}$$

这是一个p阶的线性预测器，也是一个FIR滤波器，它根据过去的采样预测当前的值，同时返回预测方差。预测错误近似于高斯白噪声。

预测效果示例
![预测效果](https://ww2.mathworks.cn/help/examples/signal/win64/EstimateASeriesUsingAForwardPredictorExample_01.png)

预测误差示例
![预测误差](https://ww2.mathworks.cn/help/examples/signal/win64/EstimateASeriesUsingAForwardPredictorExample_02.png)

https://ww2.mathworks.cn/help/signal/ref/lpc.html

[1] Jackson, L. B. Digital Filters and Signal Processing. 2nd Edition. Boston: Kluwer Academic Publishers, 1989, pp. 255–257.