
Matlab的yulewalk函数：
$$\begin{align*}
\frac{B(z)}{A(z)}&=\frac{b_0+b_1 z^{-1}+\cdots+b_n z^{-(n-1)}}{a_0+a_1 z^{-1}+\cdots+a_n z^{-(n-1)}}\\
&=(b_0+b_1 z^{-1}+\cdots+b_n z^{-(n-1)})\cdot\frac{1}{a_0+a_1 z^{-1}+\cdots+a_n z^{-(n-1)}}
\end{align*}$$

能看到传递函数的后半部分对应一个YuleWaler自回归方程
$\displaystyle \gamma _{m}=\sum _{k=1}^{p}\varphi _{k}\gamma _{m-k}+\sigma _{\varepsilon }^{2}\delta _{m,0}$


Algorithms
yulewalk designs recursive IIR digital filters using a least-squares fit to a specified frequency response. The function performs the fit in the time domain.

To compute the denominator coefficients, yulewalk uses modified Yule-Walker equations, with correlation coefficients computed by inverse Fourier transformation of the specified frequency response.

To compute the numerator, yulewalk follows these steps:

Compute a numerator polynomial corresponding to an additive decomposition of the power frequency response.

Evaluate the complete frequency response corresponding to the numerator and denominator polynomials.

Use a spectral factorization technique to obtain the impulse response of the filter.

Obtain the numerator polynomial by a least-squares fit to this impulse response.

References
[1] Friedlander, B., and Boaz Porat. "The Modified Yule-Walker Method of ARMA Spectral Estimation." IEEE® Transactions on Aerospace Electronic Systems. Vol. AES-20, Number 2, 1984, pp. 158–173.

https://en.wikipedia.org/wiki/Autoregressive_model#Yule%E2%80%93Walker_equations

YuleWalker方程解法：
http://www-stat.wharton.upenn.edu/~steele/Courses/956/Resource/YWSourceFiles/YW-Eshel.pdf