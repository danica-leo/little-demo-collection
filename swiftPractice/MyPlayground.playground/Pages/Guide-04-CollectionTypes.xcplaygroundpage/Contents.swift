/*
 1 Collection Types
 */

/*
 2 Mutability of Collections
 */

/*
 3 Arrays
 */

/**
 3.1 Array Type Shorthand Syntax
 */


/**
 3.2 Creating an Empty Array
 */

var someInts:[Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

/**
 3.3 Creating an Array with a Default value
 */
var threeDoubles = Array(repeating: 0.0, count:3)

/**
 3.4 Creating an Array by Adding Two Arrays Together
 */
var anotherThreeDoubles = Array(repeating:2.5,count:3)
var sixDoubles = threeDoubles + anotherThreeDoubles

/**
 3.5 Creating an Array with an Array Literal
 */
var shoppingList = ["Eggs","Milk"]

/**
 3.6 Accessing and Modifying an Array
 */
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty. ")
} else {
    print("The shopping list isn't empty. ")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas","Apples"]
print(shoppingList)

shoppingList.insert("Maple Syrup", at:0)

let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

/**
 3.7 lterating Over an Array
 */

for item in shoppingList {
    print(item)
}

for (index,value) in shoppingList.enumerated(){
    print("Item \(index + 1): \(value)")
}

/*
 4 Sets
 */

/**
 4.1 Hash Values for Set Types
 */

/**
 4.2 Set Type Syntax
 */

/**
 4.3 Creating and Initializing an Empty Set
 */
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

letters.insert("a")
letters.insert("a")
letters = []

/**
 4.4 Creating a Set with an Array Literal
 */
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

/**
 4.5 Accessing and Modifying a Set
 */
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As for as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never mudch cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

/**
 4.6 Iterating Over a Set
 */
for genre in favoriteGenres {
    print(genre)
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

/*
 5 Performing Set Operations
 */

/**
 5.1 Fundamental Set Operations
 */
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

/**
 5.2 Set Memebership and Equality
 */
let houseAnimals:Set = ["🐶", "🐱"]
let farmAnimals:Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals:Set =  ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

/*
 6 Dictionaries
 */

/**
 6.1 Dictionary Type Shorthand Syntax
 */

/**
 6.2 Creating an Empty Dictionary
 */
var namesOfIntegers: [Int:String] = [:]
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

/**
 6.3 Creating a Dictionary with a Dictionary Literal
 */
var airports:[String:String] = ["YYZ":"Toronto Person","DUB":"Dublin"]

/**
 6.4 Accessing and Modifying a Dictionary
 */
print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airports is \(airportName)")
} else {
    print("That airport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB"){
    print("The removed airport's name is \(removedValue).")
}else{
    print("The airports dictionary doesn't contain a value for DUB.")
}

/**
 6.5 Iterating Over a Dictionary
 */

for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}
airports.count

for airportCode in airports.keys{
    print("Airport code:\(airportCode)")
}

for airportName in airports.values{
    print("Airport name:\(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
