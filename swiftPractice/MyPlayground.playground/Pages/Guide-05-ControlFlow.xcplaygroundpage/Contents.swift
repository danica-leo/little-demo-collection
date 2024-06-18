/*
 1 Control flow
 */

/*
 2 For-In Loops
 */

// 2.1
let names = ["Anna","Alex","Brian","Jack"]
for name in names {
    print("Hello,\(name)!")
}

// 2.2
let numberOfLegs = ["spider":8,"ant":6,"cat":4]
for (animalName,legCount) in  numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// 2.3
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// 2.4
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// 2.5
let minutes = 60
var string2_5 = ""
for tickMark in 0 ..< minutes {
    string2_5 += "-\(tickMark)"
    print(string2_5)
}

// 2.6 stride
let minuteInterval = 5
var string2_6 = ""
for tickMark in stride(from:0, to:minutes, by:minuteInterval){
    string2_6 += "-\(tickMark)"
    print(string2_6)
}


// 2.7
let hours = 12
let hourInterval = 3
var string2_7 = ""
for tickMark in stride(from:3, through: hours, by:hourInterval){
    string2_7 += "-\(tickMark)"
    print(string2_7)
}

/*
 3 While Loops
 */

/*
 3.1 While
 */
