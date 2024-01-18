1. Getting Started

- 起步工作，如何将 webpack 应用在一个简单的静态网页上

2. Asset Management

- 如何使用 webpack 管理其他类型的问资源

3. Output Management

- 如何管理打包结果的输出
- 自动添加 HTML
- 自动清理目标目录
- 打包结果的明细清单 WebpackManifestPlugin（TODO）

4. Development

- debug 工具，代码定位，source map
- 三种本地开发服务器的搭建方式：watch mode/webpack-dev-server/webpack-dev-middleware

5. Code Splitting

- 多个 entry 会产生多个结果
- 指定不同入口共享的相同依赖（容易产生循环引用的问题，记得开启 runtimeChunk“single”）
- 动态导入
- prefetch 和 preload 的作用，以及性能影响
- 分析打包结果

6. Caching

- 管理输出文件名（影响缓存方式
- runtime 代码包
- vendors 代码包
- TODO：moduleID？

7. Authoring Libraries

- 工具代码库的配置方式

8. Environment Variables

- 环境变量与 webpack-cli 的使用
- 配置文件可以导出函数

9. Build Performance

- 提升打包速度

10. Content Security Policies

- 内容安全策略，或许可以看看它对应着哪些基础内容，但也有代价

11. Development Vagrant

- 生产环境模拟

12. Dependency Management

- 引入包的语句包含动态表达式，对应的行为

13. Installation

- 安装 webpack 的方式（这应该放在第一章吧

14. Hot Module Replacement

- 开发环境中的模块热替换

15. Tree shaking

- 讲了两种消除死代码的方式
- 第一种：利用 ECMAScript Modules 的特性，使用 terser 检测语句中的副作用（terser 是 uglify-js 的升级版本）
- 第二种：使用 sideEffects，跳过整个代码块

16. Production

- 15&16 的练习 demo 是连续的，进行整体阅读
- 很多工具包会在内部关联 process.env.NODE_ENV，所以有时候自己想在 none 模式下开启 tree-shaking 还挺难

17. Lazy loading

- code splitting 的后续章节，动态加载 package 的示例

18. ECMAScript Module

- 把模块打包成 ECMAScript 的方式

19. Shimming

- 可以敲一下，有 demo 的不知道什么功能，看起来像是告诉 webpack 注册全局依赖自动导入

20. TypeScript

- TODO，集成 TS

21. Web Workers

- 为什么这个还要专门讲

22. Progressive Web Application

- 和上一章搭配阅读

23. publicPath

- 似乎有一些看不懂的花式用法

24. integrations

- 自动工具：Grunt/Gulp/
- 测试框架：Mocha/Karma

25. Asset Modules

- 资源文件模块的使用方式(曾经的使用方式+当前的配置方式+Public Path)

26. Entry advanced - 入口进阶-多种文件的入口（感觉没啥用）

27. Package exports - 对于工具包或者库包的指定导出（看看 vue 和 webpack 是怎么写的
