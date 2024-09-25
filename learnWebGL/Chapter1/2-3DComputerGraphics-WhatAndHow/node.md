# 3D Computer Graphics - What and How

 Raster graphics
 Vector graphics

 光栅图像 / 矢量图像

 Computer-generated imagery （CGI）

 graphic pipeline

 not programmable

 added complexity
 shader

### The graphics pipeline

#### Step1：Input model vertices
normal vector，model vertices，color data

#### Step2：Model view transform

###### vertex shader：a computer program written in GLSL that positions the geometry of models in a scene.
    "Vertex shader"（顶点着色器）是图形处理中的一种程序，主要用于渲染3D图像。它运行在GPU（图形处理单元）上，负责处理3D模型中的每个顶点的数据。顶点着色器的主要任务包括对顶点的位置、颜色、纹理坐标等属性进行计算和变换，以及为下一阶段的图形管线（如几何着色器或片元着色器）准备数据。

    顶点着色器可以通过一些基本的操作，如位移、旋转和缩放，来影响顶点的位置和属性。这些操作通常是根据3D图像的视角和光源等因素进行的，以达到所需的视觉效果。在现代图形API如OpenGL或DirectX中，顶点着色器是可编程的，允许开发者自定义顶点处理逻辑，以创建更复杂和动态的视觉效果。

    GLSL（OpenGL Shading Language，OpenGL着色语言）是用于在OpenGL中编写着色器（如顶点着色器、片元着色器和几何着色器）的高级编程语言。它提供了一种标准方式来编写在图形卡上直接运行的自定义代码，用于图形渲染的各个阶段。

    GLSL使开发者能够详细控制图形渲染过程中的顶点和像素处理。着色器用GLSL编写，允许进行复杂的数学运算和逻辑操作，以实现如光照、阴影、纹理映射、颜色变换等高级视觉效果。

    GLSL的语法类似于C语言，包括数据类型、控制结构和自定义函数等。这种语言允许图形开发者更精细地控制硬件执行的操作，从而可以优化渲染性能和增强图形质量。


#### Step3: Projection Transform
将3D图像投影到2D画面上

#### Step4: Normalize & Clip Transform
裁截摄像头以外的画面