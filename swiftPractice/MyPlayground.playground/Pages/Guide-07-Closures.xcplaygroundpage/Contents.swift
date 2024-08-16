
/*
 1 Closures
 */


/*
 2 Closure Expression
 */

/**
 2.1 The sorted methods
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by:backward)

/**
 2.2 Closure Expreesiong Syntax
 */
reversedNames = names.sorted(by:{(_ s1:String,_ s2:String) -> Bool in return s1 > s2 })


/**
 2.3 Inferring Type From Context
 */
reversedNames = names.sorted(by:{ s1, s2 in return s1 > s2})


/**
  2.4 Implicit Returns from Single-Expression Closures
*/

reversedNames = names.sorted(by:{ s1, s2 in s1 > s2 })


/**
  2.5 Shorthand Argument Names
*/

reversedNames = names.sorted(by:{ $0 > $1 })

/**
  2.6 Operator Methods
*/

reversedNames = names.sorted(by: >)


/*
 3 Trailing Closures
 */
reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16,58,510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
