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
//3.1.1哇这个蛇的游戏规则看不懂啊，算了先直接敲demo吧
let finalSqure = 25
var board = [Int](repeating:0, count:finalSqure + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSqure {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print("square",square)
}
print("Game over!")
