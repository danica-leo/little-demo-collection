// Simple Values
import UIKit

var str:String
str = "hello,playgroud!"

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

var myVariable = 55
myVariable = 66
let myConstant : Int
myConstant = 33

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let orangeSummary = "I have \(apples + oranges) pieceof fruit."

let friendName = "Lily"
let lilyMoney:Float = 11.11
let myMoney:Float = 2

let greeting = "Hi \(friendName), Can you lend me a little money?"
let moneySummaryWrong = "now I have \(lilyMoney + myMoney) RMB! "
let total = lilyMoney + myMoney

let quotation = """
        Even though there is whitespace to the left,
        the actual lines are not indented.
                Except for this line.
        Double quotes (") can appear with out being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """

var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"
print(fruits)
fruits.append("blueberries")

var occupations = [
    "Malcolm": "Captain",
    "Keylee": "Mechanic"
]
occupations["Jayne"]="Public Relations"
fruits.append("blueberries")

fruits = []
occupations = [:]

//3 Control FLow

//3.1 for-in and if-else
let individualScores = [74,43,107,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}
print(teamScore)

//3.2 if with assignment statement
let scoreDecoration = if teamScore > 10 {
    "🤣"
} else {
    ""
}
print(teamScore,scoreDecoration)

//3.3 optional values & nill
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalEmtpy: String?
print(optionalEmtpy == nil)


//3.4 if-let-else
var optionalName: String? = "John Appleseed"
var greeting2 = "Hello"
if let name = optionalName {
    greeting2  = "Hello, \(name)"
}
optionalName = nil
var greeting3 = "Hello3"
if let name2 = optionalName {
    greeting3 = "Hello, \(name2)"
} else {
    greeting3 = "Is there any body?"
}

//3.5 ？？
let nickname: String? = nil
let fullName: String = "Davor"
let informalGreeting = "Hi \(nickname ?? fullName)"

if let nickname {
    print("Hey,\(nickname)")
}else {
    print("Is there any body?")
}

// 3.6
// switch & let x where x.hasSuffix("pepper")
// do not need to explicitly break out

let vegetable = "red pepper"
switch vegetable {
    //相等
case "celery":
    print("Add some raisins and make ants on a log")
    // 符合条件之一
case "cucumber","watercress":
    print("That would make a goog tea sandwich")
    // 如果符合x.hasSuffix条件，进行给x赋值，进行符合条件的语句
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print ("Everything tastes good in soup")
}

// 3.7
// for-in & unordered collection & iterated over in an arbitrary order

let interestingNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Squqre":[1,4,9,16,25]
]
var largest = 0
var largestType:String? = nil
for(type,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest{
            largest = number
            largestType = type
        }
    }
}
print(largest,largestType ?? "noType")

// 3.8
// while and repeat-while

var n = 2
while(n<0){
    n*=2
}
print(n)

var m = 2
repeat {
    m *= 2
}while m < 0
print(m)

// 3.9
// ..<
var total2 = 0
for i in 0..<4{
    total2 += i
}
print(total2)

// 4 Functions and Closures
