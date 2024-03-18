function createFunctions () {
  var result = new Array()
  //这是 var 时代的问题了
  for (var i = 0; i < 10; i++) {
    result[i] = function () {
      return i
    }
  }
  return result
}

console.log("first", createFunctions())

function createFunctions () {
  var result = new Array()
  for (var i = 0; i < 10; i++) {
    result[i] = function (num) {
      return function () {
        return num
      }
    }(i)
  }
  return result
}

console.log("second", createFunctions()[0]())



function createFunctions () {
  let result = new Array()
  for (let i = 0; i < 10; i++) {
    result[i] = function () {
      return i
    }
  }
  return result
}

console.log("third", createFunctions()[0]())