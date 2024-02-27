目标：完成本节demo

TODO：Loading Polyfills


记录：
回忆一下getting started讲了什么
1.确认node+npm版本，初始化项目并将其类型设置为私有项目
2.安装webpack webpack-cli
3.通过原始的html script标签引入工具代码包
4.使用webpack管理安装引用工具代码包，将构建打包结果存放在dist目录
4.1 提到了webpack对于modules系统的支持
5.使用webpack.config.js文件
6.使用预设的脚本直接启动webpack


Shimming（垫片）支持两种应用场景：
A. 类似于lodash，jQuery一样的全局变量。（不被规范推荐，违反模块封装原则，请在尽量只在必要时使用）
B. 对于个别浏览器的功能兼容性实现polyfill（根据实际需求加载的代码包）


遗留问题：
1. global shimming中提到使用['lodash','join']的方式全局引入join变量可以应用tree shaking，但打包结果的代码包和之前对比并无区别（没有减少）
[TODO]2. granular shimming中提到在commonJS的包中this会指向到module.exports，但如何确定？demo还缺失了imports-loader的安装指示？
3. global exported 使用exports-loader改装旧代码，可以在不改动旧文件的情况下使旧代码兼容使用module功能导入导入
4. loading polyfills 通过使用webpack多入口打包出单独的polyfill包，再在入口页根据浏览器功能加载不同的包（babel-polyfill*whatwg-fetch）
[TODO]5. further optimizations babel-preset-env同时还支持将全局 babel-polyfill 导入转换为更精细的逐个特征导入模式：
[TODO]6. node build-ins node的内置功能可以直接在配置文件中填充
7. other utilities 其他处理遗留模块的工具： noParse，imports-loaders
8. 更多阅读（TODO）