目标：完成本节 demo（完成次数：1）

TODO：Loading Polyfills

记录：
回忆一下 getting started 讲了什么 1.确认 node+npm 版本，初始化项目并将其类型设置为私有项目 2.安装 webpack webpack-cli 3.通过原始的 html script 标签引入工具代码包 4.使用 webpack 管理安装引用工具代码包，将构建打包结果存放在 dist 目录
4.1 提到了 webpack 对于 modules 系统的支持 5.使用 webpack.config.js 文件 6.使用预设的脚本直接启动 webpack

Shimming（垫片）支持两种应用场景：
A. 类似于 lodash，jQuery 一样的全局变量。（不被规范推荐，违反模块封装原则，请在尽量只在必要时使用）
B. 对于个别浏览器的功能兼容性实现 polyfill（根据实际需求加载的代码包）

分节笔记：

1. global shimming 中提到使用['lodash','join']的方式全局引入 join 变量可以应用 tree shaking，但打包结果的代码包和之前对比并无区别（没有减少）
2. [TODO]granular shimming （细节上的代码缓冲垫片）中提到在 commonJS 的包中 this 会指向到 module.exports（但应该指向在 window 里），但如何确定？demo 还缺失了 imports-loader 的安装指示？
3. global exported 使用 exports-loader 改装旧代码，可以在不改动旧文件的情况下使旧代码兼容使用 module 功能导入导入
4. loading polyfills 通过使用 webpack 多入口打包出单独的 polyfill 包，再在入口页根据浏览器功能加载不同的包（babel-polyfill \* whatwg-fetch）
5. [TODO]further optimizations babel-preset-env 同时还支持将全局 babel-polyfill 导入转换为更精细的逐个特征导入模式：
6. [TODO]node build-ins node 的内置功能可以直接在配置文件中填充
7. other utilities 其他处理遗留模块的工具： noParse，imports-loaders
8. [TODO]更多阅读

总结：
该章节讲述了以下两点 1.如何使用 webpack 处理遗留代码包（legacy codes）
1.1 全局导入变量
1.2 this 的指向（）
process.NODE.env?？？？？

重读 granular shimming 1.本节更想演示的是一些历史遗留代码无法更改源文件，但需要在后续实现上兼容 this 不指向“预设执行上下文”的情况。使用 imports-loader 可以强制将 window 全局执行上下文绑定在指定文件上
TODO 自己实现一个demo