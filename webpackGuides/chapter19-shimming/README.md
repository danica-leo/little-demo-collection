目标：完成本节demo

阶段目标：
英文复习getting start demo（进行中）
TODO：跟随本节demo引导


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
