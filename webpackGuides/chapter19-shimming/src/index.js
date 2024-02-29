
function component () {
  const element = document.createElement('div')

  element.innerHTML = join(['Hello', 'webpack'], ' ')

  // Assume we are in the cotext of 'window'
  // this maybe not ？ try it ！
  // 但这里的this不会，说明他其实指向the cotext of 'window'
  debugger
  console.log("inner-this", this)
  this.alert("Hmmmm,this probably isn't a great idea")

  return element
}

document.body.appendChild(component())

const { file, parse } = require('./globals.js')
//这里的this会报错
//能在断点中看到this嘛？能
// 但为什么out。this有个自己的object？看起来没有包装啊？
// webpack打包时包装了，包装在333里，他在闭包里以__webpack_modules__以333的id存在，是个可以运行的函数
// 但是333函数的[[scope]]里看起来明明有Global Window，为什么调用不上去？
//包装层级是
//能用console.log打印出this吗？
debugger
console.log("out-this", this)
this.alert("file", file)
parse()

fetch('https://jsonplaceholder.typicode.com/users')
  .then((response) => response.json())
  .then((json) => {
    console.log(
      "We retrieved some data! AND we're confident it will work on a variety of browser distributions."
    )
    console.log(json)
  })
  .catch((error) =>
    console.error('Something went wrong when fetching this data: ', error)
  )
