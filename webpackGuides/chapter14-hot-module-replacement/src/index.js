import printMe from './print'

document.body.innerHTML = "Hello webpack!!"


if (module.hot) {
  module.hot.accept("./print.js", () => {
    console.log("Accepting the updated printMe module!")
    printMe()
  })
}