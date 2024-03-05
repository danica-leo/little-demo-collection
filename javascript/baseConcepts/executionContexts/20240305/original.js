window.name = "window"

class D {
    name = "D";

    print () {
        console.info(this)
    }

    constructor(name, fn) {
        this.name = name

        if (typeof fn === "function") {
            this.print = fn
        }
    }
}

const d1 = new D("d1")
d1.print()//?
let d1A
(d1A = d1.print)() //?

function print () {
    console.info(this.name)
}

const d2 = new D("d2", print)
d2.print()//?
let d2A
(d2A = d2.print)()//?

const d3 = new D("d3", d1.print)
d3.print()//?
let d3A
(d3A = d3.print)()//?

const d4 = new D("d4", d1.print.bind(d2))
d4.print()//?
let d4A
(d4A = d4.print)()//?