tag: [matlab plot]

# Plot
Matlab通过如下结构组织图形对象
![层级结构](https://www.mathworks.com/help/matlab/creating_plots/doccenter_graphicsheirarchy.png)

坐标轴对象比较复杂一些，包含x/y/z轴的标度(scales)、刻度线(tick marks)、刻度标签(tick labels)、坐标区标签 刻度(axis lables)等.

|一张由线、坐标轴和Legend组成的图|对应的层级结构|
|---|---|
|![Matlab图](https://www.mathworks.com/help/matlab/creating_plots/org_obj.png) | ![层级结构](https://www.mathworks.com/help/matlab/creating_plots/v2_gobjects_top-01.png)|
#### 画图顺序
1. 设置坐标轴范围
2. 执行plot等函数画图
3. 画网格线、刻度等
如果先划网格线，后画图，会被覆盖基本看不到网格线
4. 添加legend、标题等
5. 调整图片大小

