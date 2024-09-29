# 1.3 Computer graphics - A Brief History

1963年 MIT PhD 
论文发布了以后大家都觉得好用，但是技术一开始没有统一标准，同一个需求需要做系统到系统的移植时非常复杂。
曾经ISO机构提供了一种解决方案，宣称是最终极标准的方式。但是由于它不仅提供了绘制立体图像的方程库，同时还规定了数据的组织和存放方式，程序员们都讨厌这样。

### GL and OpenGL

硅谷图像公司卖自家硬件的时候打包附送自家的图像开发软件，后来在1990年代发布了自己的图像开发库并将其开源了，因其可拓展性及实用价值较高，成功了？
Graphic Library，跨平台可移植实施性，甚至支持多种手机系统。但Direct3D

也介绍了OpenGL的多个版本

### OpenGL ES
嵌入式子集 Embedded

### WebGL

WebGL 是为任何兼容 HTML 5.0 的网络浏览器实现的 OpenGL ES 2.0。 由于所有网络浏览器都支持 JavaScript，因此 WebGL 定义了用于实时 3D 图形渲染的 JavaScript API。 由于现在基本上所有的设备都有 GPU，这就意味着您编写的一个程序基本上可以在现在和未来的所有计算机设备上执行，这要归功于 HTML 5.0 和 WebGL 标准。

WebGL 的当前版本是 **WebGL 2.0**，基于 OpenGL ES 3.0。相比于 WebGL 1.0，WebGL 2.0 引入了许多新特性，如 3D 纹理、采样器对象和变换反馈（Transform Feedback）。这些功能使得 WebGL 能够更高效地渲染更复杂的 3D 场景和图形，同时保持跨平台的兼容性。

WebGL 2.0 已广泛支持主流浏览器，包括 Chrome、Firefox、Safari 和 Edge，在桌面和移动设备上均可使用。尽管 WebGL 2.0 在所有主要浏览器中基本上已成为标准，但移动设备上的支持可能会有一些差异 [oai_citation:2,WebGL: 2D and 3D graphics for the web - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API) [oai_citation:1,WebGL 2.0 | Can I use... Support tables for HTML5, CSS3, etc](https://caniuse.com/webgl2)。

对于更现代的应用，**WebGPU** 是一个正在发展的新标准，旨在提供比 WebGL 更高效的 GPU 访问能力。

WebGPU 是一项新兴的图形 API，它旨在取代 WebGL，提供更高效的 GPU 访问和更灵活的跨平台图形和计算能力。WebGPU 由 W3C 推动开发，目标是为现代浏览器和设备带来更接近于原生图形 API 的性能，类似于 Vulkan、Direct3D 12 和 Metal。

### WebGPU 的主要特点：
1. **更高效的 GPU 访问**: WebGPU 相比于 WebGL，提供了更高效的底层硬件访问，特别是通过支持现代图形 API（如 Vulkan 和 Direct3D 12）的概念，使得图形计算和渲染效率显著提高。
  
2. **计算着色器支持**: WebGPU 提供了对计算着色器的支持，这意味着除了图形渲染之外，开发者还可以在 GPU 上进行高效的并行计算任务。这使得 WebGPU 适用于更广泛的应用，如机器学习、物理仿真等。

3. **更现代的 API 设计**: WebGPU 通过引入类似 Vulkan 的 API 设计，为开发者提供了更精细的资源管理和多线程并行化能力。与 WebGL 相比，WebGPU 的 API 更简洁，设计时考虑了现代 GPU 的架构。

4. **跨平台支持**: WebGPU 旨在在多个平台上提供一致的体验，包括桌面和移动设备，以及不同的操作系统，如 Windows、macOS、Linux 和 Android。它还可以通过浏览器直接访问，无需安装插件。

### WebGPU 的发展和应用：
WebGPU 的标准化工作仍在进行中，但目前在一些现代浏览器（如 Chrome 和 Firefox）中已提供实验性支持。它被视为未来高性能图形和计算的主要 API 之一，尤其是在浏览器和 Web 应用中。

WebGPU 的发展方向使其适用于更复杂和高效的 3D 应用场景，如高端游戏、虚拟现实（VR）和增强现实（AR）应用等 [oai_citation:2,WebGL: 2D and 3D graphics for the web - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API) [oai_citation:1,WebGL 2.0 | Can I use... Support tables for HTML5, CSS3, etc](https://caniuse.com/webgl2)。

如果你对 WebGPU 的使用感兴趣，以下资源可以帮助你进一步了解：
- [WebGPU API 文档](https://gpuweb.github.io/)
- [W3C WebGPU 规范](https://www.w3.org/TR/webgpu/)