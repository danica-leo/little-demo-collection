class A {
  print () {
    console.info(this)
  }
}

const a = new A()
a.print()//打印了什么？
/**
 * a的上下文，一个空对象（并且是class A的实例）
*/


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

const b1 = new B()
b1.addCallback(a.print)
b1.runCallbacks()//打印了什么？
/**
 * 在b1中的this.callbacks.forEach的回调中调用了fn=>fn() ,然后就是a.print();
 * this.callbacks.forEach没有上下文？
 * 所以fn（）打印了undefined？
*/

const b2 = new B()
function print () {
  console.log("caller", print.caller)
  console.info(this)
}
b2.addCallback(print)
b2.runCallbacks()//打印了什么？
/**
 * 如果上面的答案成立，那这里其实也应该是undefined，但我印象中答案不是这样的
 */

//不知道为啥，看看搜到的讲解吧
//https://www.javascripttutorial.net/javascript-execution-context/

//调用堆栈:这个总没错吧，打断点看一眼
// fn()
// callback：() => fn()
// 错：this.callbacks.forEach(callback)//打断点看这里好像没有堆栈，直接进入下一个了
// b2.runCallbacks（）
// main（）

//总不能是实际代码里调用该函数的最外面的那一行的执行上下文吧。。。
//好像是这样的，再找道题验证一下