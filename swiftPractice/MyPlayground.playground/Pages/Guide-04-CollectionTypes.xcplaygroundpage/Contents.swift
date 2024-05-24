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
