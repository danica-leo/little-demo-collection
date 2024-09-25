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


#### Step5: Viewport Transfrom
将3d对象与栅格化图像像素点对应起来

#### Step6: Rasterize

Rasterization is an essential process in computer graphics, especially when converting vector graphics (which use mathematical equations to define shapes) into raster graphics (which use pixels). This process is crucial for rendering images on screens or printing them.

#### Step7：Shading - Fragment Shader

“Shader” 翻译成“着色器”而不是“渲染器”，这是因为两者在功能和概念上有明显的区别。

### 1. **Shader（着色器）**
- **定义**: Shader 是一种在图形处理过程中执行特定任务的小程序或代码，用于决定如何计算每个像素、顶点或片段的颜色及其他属性。
- **功能**: 它主要负责“着色”，也就是确定物体表面的颜色、光照、阴影等视觉效果。Shader 本质上是一种编程工具，用来描述如何在一个三维场景中生成二维图像的特定视觉效果。
- **类型**: 常见的 Shader 类型包括顶点着色器（Vertex Shader）、片段着色器（Fragment Shader）和几何着色器（Geometry Shader）。
- **翻译为“着色器”**: 这个翻译强调了 Shader 的核心作用是“着色”，即控制图形如何呈现颜色和光照效果。

### 2. **Renderer（渲染器）**
- **定义**: Renderer 是一种更为综合性的工具或引擎，负责整个图形渲染管线的执行，从物体模型的处理、光照计算到最终的图像生成。
- **功能**: 它是一个完整的图形渲染系统，涵盖了从场景描述、光照计算、材质处理到最终图像输出的全过程。比如我们常用的三维渲染引擎 Unity、Unreal Engine 中的渲染引擎模块。
- **职责范围更广**: 渲染器不仅仅包括着色的过程，还包括视角投影、几何变换、光线追踪等更复杂的场景管理和图形生成功能。
- **翻译为“渲染器”**: 这个翻译更强调整个渲染过程的执行和管理，而不仅仅是颜色计算。

### 总结
- **着色器（Shader）** 强调的是图形管线中如何决定图形表面颜色和光照效果的部分，偏向于“微观”层面。
- **渲染器（Renderer）** 强调的是整个渲染过程，涵盖了从模型数据处理到最终图像输出的完整流程，属于“宏观”层面。

因此，“Shader” 翻译为“着色器”更能准确传达其在图形渲染中所扮演的角色。