debugger
class A {
  // class中的代码全都是严格模式
  print () {
    // console.log("callee", arguments.callee)
    // console.log("caller", print.caller)
    console.info(this)
  }
}

const a = new A()
a.print()//打印了什么？


class B {
  constructor() {
    this.callbacks = []
  }

  addCallback (fn) {
    this.callbacks.push(fn)
  }

  runCallbacks () {
    this.callbacks.forEach((fn) => {
      fn()
    })
  }
}

const b1 = new B()
b1.addCallback(a.print)
b1.runCallbacks()//打印了什么？

const b2 = new B()
function print () {
  console.log("caller", print.caller)
  console.info(this)
}
b2.addCallback(print)
b2.runCallbacks()//打印了什么？


//附加题
A.prototype.print()//打印了什么？