const file = 'blah.txt'
const helpers = {
  test: function () {
    console.log("test something")
  },
  parse: function () {
    console.log("parse something")
  }
}
//此文件之前并没有任何导入导出语句，通过webpack的exports-loader可以添加modules导入导出兼容，从而在index.js中引用