/*
 0 Enumerations
 */

/*
 1 Enumeration Syntax
 */

enum CompassPoint {
    case north
    case south
    case east
    case west
}


enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

/*
 2 Matching Enumeration Values with a Switch Statement
 */

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

/*
 3 Iterating over Enumeration Cases
 */

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases{
    print(beverage)
}


/*
 4 Associated Values
 */
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productCode = Barcode.upc(8, 85909, 51226, 3)
print(productCode)

productCode = .qrCode("Blabalbaldkjfalkdjkflas")

switch productCode {
case .upc(let numberSystem, let manufacturer,let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode ):
    print("QR code: \(productCode) ")
}

/*
 5 Raw Values
 */

enum ASCIIControlCharacter:Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


// 5.1 Implicitly Assigned Raw Values

enum Planet5: Int {
    case mercury = 1, venues, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint5: String{
    case north, south, east, west
}

let earthOrder  = Planet5.earth.rawValue
let sunsetDirection = CompassPoint5.west.rawValue

// 5.2 Initializing from a Raw Value
let possiblePlanet = Planet5(rawValue:7)

let positionToFind = 11
if let somePlanet = Planet5(rawValue: positionToFind) {
    switch(somePlanet){
    case .earth:
        print("Mostly harmless.")
    default:
        print("Not a safety place for humans.")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

/*
 6 Recursive Enumerations
 */
//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression,ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression,ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(four, five)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression:ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left,right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) + evaluate(right)
    }
}

print(evaluate(product))
