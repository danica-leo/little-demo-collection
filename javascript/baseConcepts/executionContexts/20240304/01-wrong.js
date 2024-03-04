window.name = "window"

class D {
  name = "D"

  print = () => {
    console.info(this.name)
  };

  constructor(name, fn) {
    this.name = name

    if (typeof fn === "function") {
      this.print = fn
    }
  }
}

const d1 = new D("d1")
d1.print() //箭头函数，定义处作用域（怎么又跟作用域扯上关系了），打印D

function print () {
  //普通函数，调用时的上下文
  console.info(this.name)
}

const d2 = new D("d2", print)
d2.print() // d2调用的，所以打印d2

const d3 = new D("d3", d1.print)
d3.print() // d1的print方法还是箭头函数，所以打印D

const d4 = new D("d4", d1.print.bind(d2))
d4.print() //
/**
 * 涉及到一个问题： 箭头函数能bind吗？
 *    如果能bind，那这里应该是 d2
 *    如果不能，那这里应该是 D
 * 试了一下，不能bind，感觉应该是D
*/

/** 本次作答答案
 * "D"
 * "d2"
 * "D"
 * "D"
 */

