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
