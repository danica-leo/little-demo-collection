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
