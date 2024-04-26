/*
 1  Basic Operators
 more information https://developer.apple.com/documentation/swift/operator-declarations
 */

/*
 2  Terminology
 */

/*
 3 Assignment Operator
 */

let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

if x == y {
    print("test? Hahahah")
}

/*
 4 Arithmetic Operators
 
 Addtion, Subtraction, Multiplication, Division
 */

1 + 2
5 - 3
2 * 3
10.0 / 2.5

print("Hello, "+"world!")


/**
  4.1   Remainder Operator
 */

9 % 4

-9 % 4

/**
 4.2 Unary Minus Operator
 */
let three = 3
let minusThree = -three
let plusThree = -minusThree

/**
 4.3 Unary Plus Operator
 */
let minusSix = -6
let alsoMinusSix = +minusSix

/*
 5  Compound Assignment Operators
 */
var a2 = 1
a2 += 2

/*
 6 Comparison Operators
 */
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name),but I don't recognize you")
}

(1,"zebra") < (2,"apple")
(3,"apple") < (3, "bird") //why apple is less than bird?
let apple = "apple"
let bird = "bird"
apple < bird
(4,"dog") == (4,"dog")

/*
 ７　Ternary Conditional Operator
 */

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/*
 8 Nil-Coalescing Operator
 */
let defaultColorName = "red"
var userDefinedColorName:String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

/*
 9 Range Operators
 */

/**
 9.1    Closed Range Operator
 */
for index in 1...5{
    print("\(index)  times 5 is \(index * 5)")
}
/**
 9.2    Half-Open Range Operator
 */
let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}
/**
 9.3   One-Sided Ranges
 */
for name in names[2...]{
    print(name)
}

for name in names[...2]{
    print(name)
}

let range = ...5
print(range)

/*
 10 Logical Operagtors
 */

/**
 10.1    Logical NOT Operator
 */
let allowedEntry = false
if !allowedEntry {
    print("Access Denied!")
}
/**
 10.2   Logical AND Operator
 */
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied!")
}
/**
 10.3   Logical OR Operator
 */
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied!")
}

/**
 10.4 Combining Logical Operators
 */
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied!")
}

/**
 10.5 Explicit Parentheses
 */
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied!")
}

// FINISH 🎉
