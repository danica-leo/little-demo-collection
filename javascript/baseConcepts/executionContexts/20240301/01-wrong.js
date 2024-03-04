class A {
  print () {
    console.info(this)
  }
}

//new,a中有自己的执行上下文
const a = new A()
//a自己的执行上下文是个空对象，所以这里是打印”a的上下文：一个空对象“
a.print()

class B {
  constructor() {
    this.callbacks = []
  }

  addCallback (fn) {
    this.callbacks.push(fn)
  }

  runCallbacks () {
    this.callbacks.forEach(fn => fn())
  }
}

//B有自己的执行上下文
const b1 = new B()
//b1的[[scope]]里保存了[全局上下文,b1上下文]
//b1.addCallback调用时，运行时执行上下文是b1的自有上下文
b1.addCallback(a.print)
//b1.runCallbacks调用时，上下文的入栈顺序应该是
// [ 
//   全局上下文，
//   runCallbacks上下文=b1上下文，
//   array.forEach的上下文=调用处的上下文=b1上下文？，
//   forEach callback的上下文（箭头函数，此处上下文应该是声明处的上下文=b1上下文），
//   a.print的上下文
// ]
//所以打印出来的应该还是 “a的上下文：：一个空对象“
b1.runCallbacks()


const b2 = new B() //新建了b2上下文
function print () {
  //普通的函数，声明处在全局
  console.info(this)
}
//照常添加
b2.addCallback(print)
//b2.runCallbacks调用时，上下文的入栈顺序应该是
// [
//   1.全局上下文，
//   2.runCallbacks上下文 = b2上下文，
//   3.array。forEach的上下文=调用处的上下文=b2上下文？
//   4.forEach callback的上下文（箭头函数，是声明处的上下文 = b2上下文），
//   5.window.print在b2中被调用，打印b2上下文，
// ]
//内容为
// {
//   callbacks:[function print];
// }
b2.runCallbacks()

