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


// 3.1 While


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


// 3.1.2 Repeat-While

square = 0
diceRoll = 0
repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
} while square < finalSqure
print("Game over!")
// 看起来repeat while 比while少了一条判断语句

//自己复习一下上面两个demo
let finalSquare2 = 25
// int数组初始化的语法
var board2 = [Int](repeating: 0, count: finalSquare2)

board2[03] = +08; board2[06] = +11; board2[09] = +9; board2[10] = +2;
board2[14] = -10; board2[19] = -11; board2[22] = -2; board2[24] = -8;

var curSquare = 0
var diceRoll2 = 0 //初始化时从0开始，在代码首次的时候自动对其可取值的1，超边界情况可以灵活应对
while curSquare < finalSquare2 {
    diceRoll2 += 1
    if diceRoll2 == 7 {
        diceRoll2 = 1
    }
    
    curSquare += diceRoll2
    if curSquare < board2.count{
        print(" board2.count == finalSquare2 ", board2.count == finalSquare2)
        curSquare += board2[curSquare]
    }
    print("squre",curSquare)
}
print("Game over!")

curSquare = 0
diceRoll2 = 0
repeat{
   //头一次写的时候没写出来,TODO 有机会可以再练一遍
    curSquare += board2[curSquare]
    diceRoll2 += 1
    if diceRoll2 == 7 { diceRoll2 = 1 }
    curSquare += diceRoll2
}while curSquare < finalSquare2
print("Game over!")


/*
 4 Condition Statements
 */


// 4.1 If
var temperatureInFahrenheit = 90  //30
if temperatureInFahrenheit <= 32 {
    print("It's very cold , Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
} else {
    print("It's not that cold, Wear a T-shirt.")
}


// 4.1.2 shorthand spelling of setting values
let temperatureInCelsius = 25
let weatherAdvice:String

if temperatureInCelsius <= 0 {
    weatherAdvice = "It's very cold, Consider wearing a scarf"
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm , Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold, Wear a T-shirt"
}
print(weatherAdvice)

let weatherAdvice2 = if temperatureInCelsius <= 0 {
    "It's very cold, Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm, Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}
print(weatherAdvice2)


// 4.1.3 Explicit type
let freezeWarning:String?  = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}

let freezeWarning2 = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}


enum TemperatureError:Error {
    case boiling
}
let weatherAdvice3 = if temperatureInCelsius > 100 {
    throw TemperatureError.boiling
} else {
    "It's a reasonable temperature"
}

// 4.2 Switch

// 4.2.1 basic switch
let someCharacter:Character = "z"
switch someCharacter{
case "a":
    print("The first letter of latin alphabet")
case "z":
    print("The last letter of latin alphabet")
default:
    print("Some other character")
}

// 4.2.2 expression form
let anotherCharacter = "a"
let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}
print("message")

// 4.2.3 No Implicit Fallthrough
switch anotherCharacter {
case "a","A":
    print("The letter A")
default:
    print("Other characters")
}

// 4.2.4 Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount:String
switch approximateCount {
case 0:
    naturalCount = "No"
case ..<5:
    naturalCount = "a few"
case 5..<12:
naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// 4.2.5 Tuples
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_,0):
    print("\(somePoint) is on the X-axis")
case (0,_):
    print("\(somePoint) is on the Y-axis")
case (-2...2,-2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is out of the box")
}

// 4.2.6  Value Bindings
let anotherPoint = (2,0)
switch anotherPoint {
case (let x,0):
    print("on the x-axis with an x value of \(x)")
case (0,let y):
    print("on the y-axis with an y value of \(y)")
case let (x,y):
    print("somewhere else at (\(x),\(y))")
    //在最后case语句可以匹配所有情况时，可以不写default语句。
}

// 4.2.7 Where

let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let(x,y) where x == y:
    print("(\(x),\(y) is on the line x == y")
case let(x,y) where x == -y:
    print("(\(x),\(y) is on the line x == -y.")
case let(x,y):
    print("(\(x),\(y) is just some arbitrary")
}

// 4.2.8 Compound Cases
let someCharacter428 :Character = "e"
switch someCharacter428 {
case "a","e","i","o","u":
    print("\(someCharacter428) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter428) is a consonat")
default:
    print("\(someCharacter428) isn't a vowel or a consonat")
}

// 4.2.9 Compound Cases with value binding
let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance,0),(0,let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

/*
 5 Control Transfer Statements
 */

// 5.1 Continue
let puzzleInput = "Great minds think alike"
var puzzleOutput = ""
let characterToRemove:[Character] = ["a","e","u","i","o"," "]
for char in puzzleInput {
    if characterToRemove.contains(char){
        continue
    }
    puzzleOutput.append(char)
}

// 5.2 Break
let numberSymbol:Character = "三"
var possibleIntegerValue:Int?
switch numberSymbol{
case "1","一":
    possibleIntegerValue = 1
case "2","二":
    possibleIntegerValue = 1
case "3","三":
    possibleIntegerValue = 1
case "4","四":
    possibleIntegerValue = 1
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    print("An integer value couldn't be found for \(numberSymbol)")
}
