

- Matlab 

  ```
  fs = 8000;
  fid = fopen('test.pcm','r');
  pcm_data = fread(fid, inf, 'int16');
  pcm_data = pcm_data / 32768;
  fclose(fid);
  
  fs = 16000;
  
  t = 0:1/fs:1.0;
  % sine_2hz_20hz_200hz_2khz
  x = 1 + sin(2*pi*2*t)+sin(2*pi*20*t)+sin(2*pi*200*t)+sin(2*pi*2000*t);
  x = x/5.0;
  
  tmp = x.*65535*65535/2;
  
  fid = fopen('sine_2hz_20hz_200hz_2khz.pcm', 'wb'); 
  fwrite(fid, tmp, 'int32');
  fclose(fid);
  
  audiowrite('sine_2hz_20hz_200hz_2khz.wav', x, fs);
  ```

- Python

  ```
  import array
  import numpy as np
  import os
   
   
  def readPCM(fileName):
      file = open(fileName, 'rb')
      pcm_data = array.array('h')
      size = int(os.path.getsize(fileName) / pcm_data.itemsize)
      pcm_data.fromfile(file, size)
      file.close()
      return np.array(pcm_data) / 32768
  
  ```

- C

  ```
  
  FILE *pcm;
  pcm = fopen("./test.pcm", "rb");
  short data[128];
   
  while(size=fread(data, sizeof(short), 128, pcm)){
      float frame[128] = {0};
  	for(int i=0; i<128;i++){
  		frame[i] = data[i] / 32768;
  	}
  	
  	//processing
  }
   
  fclose(pcm);
  ```

  