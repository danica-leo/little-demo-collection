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
// 4.1 declare a function
func sayHello(name:String,weather:String)->String{
    return "Hi \(name)! today is \(weather)~"
}

sayHello(name:"Davor",weather:"sunday")

// 4.2 Write _ to use no argument label, or write a custom argument label before the parameter name
func greet(_ person:String, on day:String)->String{
    return "Hi \(person)! today is \(day)"
}

greet("Nicely",on:"Tuesday")

//4.3 The tuple returned by the function
// wronged [Int]
func calculateStatistics(scores:[Int])->(max:Int,min:Int,sum:Int){
    var max = scores[0] , min = scores[0] , sum = 0
    
    for num in scores{
        if num > max {
            max = num
        }else if num < min {
            min = num
        }
        sum += num
    }
    
    return (max,min,sum)
}

let statistics = calculateStatistics(scores:[5,3,100,3,9])
print(statistics.sum)
print(statistics.2) //4, []



//4.4 Nested function with outer variable (called as closure in JS)
func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

//4.5 first-class type can be returned : function is first-clas type
//wrong count:2
func makeIncrementer()->((Int)->Int){
    func addOne(number:Int)->Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//4.6 function can take another function as one of its paraments
func hasAnyMatches(list:[Int],condition:(Int)->Bool)->Bool{
    for i in list {
        if condition(i){
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
let nums = [20,19,7,12]
hasAnyMatches(list:nums,condition: lessThanTen)

//4.7 special closure: Function and normal closure : ({}), Watch for the word: IN
// IN is very abnormal，why in？？？
let nums2 = nums.map({(number:Int) -> Int in
    let result = 3 * number
    return result
})
print(nums2)

//4.7.1 Experiment
//TODO
let nums3 = nums.map({(number:Int) -> Int in
    let rest = number % 2
    if rest > 0 {
        return 0
    }else {
        return number
    }
})
print(nums3)

//4.8 concise closures - already now callback
//wrong count 1
let mappedNumbers = nums.map({number in 3*number})
print(mappedNumbers)


//4.9 concise closures - refer to parameters by number
//When a closure is the only argument to a function ,you can omit the paraentheses entirely
let sortedNumbers = nums.sorted{$0 > $1}
print(sortedNumbers)

//4.9.1 try again 4.8 with number refer of parameters
let mappedNumbers2 = nums.map{3*$0}
print(mappedNumbers2)

// 5 Objects and Classes

// 5.1 Create a class
class Shape {
    let color = "red"
    var numberOfSides = 0
    func simpleDescription () -> String {
        return "A simple with \(numberOfSides) sides."
    }
    func setSides(number:Int) -> () {
        numberOfSides = number
    }
}

// 5.2 create an instance of class
var shape1 = Shape()
shape1.numberOfSides = 3
var shape1Desc = shape1.simpleDescription()

var shape2 = Shape()
shape2.setSides(number: 8)
var shape2Desc = shape2.simpleDescription()

// 5.3 class initializer
class NamedShape {
    var name:String
    var numberOfSides:Int = 0
    
    init(name:String){
        self.name = name
    }
    
    func simpleDescription()->String{
        return "A shape with \(numberOfSides) sides"
    }
}

// 5.4 deinit
// 5.5 subclass :colon
// 5.6 override superclass function with "override" keywords
class Square: NamedShape {
    var sideLength : Double
    
    init(sideLength:Double,name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// 5.6.1 Experiment : implement "Circle" class
class Circle: NamedShape {
    var radius: Double
    init(radius:Double,name:String){
        self.radius = radius
        super.init(name:name)
        numberOfSides = 1
    }
    
    func area()->Double{
        return Double.pi * pow(radius, 2)
    }
    
    override func simpleDescription()->String{
        return "A circle with radius is \(radius)"
    }
}
let testCircle = Circle(radius:3,name:"my test circle")
testCircle.area()
testCircle.simpleDescription()

// 5.7 Getter & Setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength:Double,name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength) \\(\\)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter=9.9
print(triangle.sideLength) //双浮点数精度值的问题

// 5.8 willSet & didSet (which means before setting and after setting)
// TODO: repeat it~
// WHY:document said "If I don't need compute the property"
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            print("I'm triangle willSet! \(newValue.name)")
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            print("I'm square willSet! \(newValue.name)")
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double,name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size:10,name:"another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// 5.9 optional values？
// TODO:I dont understand
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


// 6 Enumeration
// 6.1 use enum to create an enumeration
enum Rank:Int {
    case ace = 1
    case two,three,four,five,six,seven,eight,nine,ten
    case jack,queen,king
    
    func simpleDescription()->String{
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.two
let aceRawValue = ace.rawValue

// 6.1.1 Experiment:Write an function that compares two Rank values by comparing their raw values.

let enum1 = Rank.ace
let enum2 = Rank.two
func compareEnumRank (v1:Rank,v2:Rank)->Bool{
    return v1.rawValue > v2.rawValue
}
compareEnumRank(v1:enum1,v2:enum2)
enum1.simpleDescription()

// 6.2 use init?(rawValue:) to make an instance of enum
if let convertedRank = Rank(rawValue: 13){
    let simpleDesc = convertedRank.simpleDescription()
}
if let convertedRank = Rank(rawValue: 15){
    let simpleDesc = convertedRank.simpleDescription()
}

// 6.3 rawValue is not necessary
// TODO
