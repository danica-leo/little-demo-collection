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
