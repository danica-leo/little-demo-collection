
function component () {
  const element = document.createElement('div')

  element.innerHTML = join(['Hello', 'webpack'], ' ')

  // Assume we are in the cotext of 'window'
  this.alert("Hmmmm,this probably isn't a great idea")

  return element
}

document.body.appendChild(component())

const { file, parse } = require('./globals.js')
this.alert("file", file)
parse()



