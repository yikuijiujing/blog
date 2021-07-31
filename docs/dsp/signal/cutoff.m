num = [1, -1];
den = [1, -0.995];
fs = 16000;
sys_z = tf(num,den, fs);         
sys = d2c(sys_z)
bode(sys);                                            
[mag,phase,w]=bode(sys);    
margin(sys);

         
