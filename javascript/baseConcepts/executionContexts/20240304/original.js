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
d1.print()

function print () {
  console.info(this.name)
}

const d2 = new D("d2", print)
d2.print()

const d3 = new D("d3", d1.print)
d3.print()

const d4 = new D("d4", d1.print.bind(d2))
d4.print()
