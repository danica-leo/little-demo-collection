
function component () {
  'use strict'
  const element = document.createElement('div')

  element.innerHTML = join(['Hello', 'webpack'])

  // Assume we are in the cotext of 'window'
  // this maybe not ？ try it ！
  debugger
  console.log("inner-this", this)
  this.alert("Hmmmm,this probably isn't a great idea")

  return element
}
const a = component()
document.body.appendChild(a)

const { file, parse } = require('./globals.js')
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
