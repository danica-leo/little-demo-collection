import printMe from './print'
import './style.css'

window.printMe = printMe

function component () {
  const element = document.createElement('div')
  const btn = document.createElement('button')

  element.innerHTML = "Hello webpack!!"
  btn.innerHTML = "Click me and check the console"
  btn.onclick = printMe
  window.printMe2 = printMe
  //应该会缓存旧的printMe

  element.appendChild(btn)
  return element
}


document.body.appendChild(component())

if (module.hot) {
  module.hot.accept("./print.js", () => {
    console.log("Accepting the updated printMe module!")
    //这里应该是新的printMe
    window.printMe3 = printMe
    printMe("module.hot")
  })
}