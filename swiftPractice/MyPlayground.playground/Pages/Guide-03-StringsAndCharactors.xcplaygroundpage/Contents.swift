import Foundation
/* 1 Strings and Characters */


/*  2 String Literals   */

let someString = "Some string literal value"

/**
 2.1 Multiline String literals
 */

let quotation = """
The White Rabbit put on his spectacles.
"Where shall I begin? please your Majesty?" he said.

"Begin at the beginning,"
the King said gravely,
"and go on till you come to the end; then stop."
"""
let singleLineString = "These are the same"
let multilineString = """
These are the same
"""

let softwrappedString = """
The white rabbit put on his spectacles. "Where shall I begin, \
please your Majestry?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line dosen't begin with whitespaces.
    """

/**
 2.2 Special Characters in String Literals
 */

let wiseWords = "\"Imageination is more important than knowledege\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let threeDoubleQuotationMarks = """
Escaping none ""
Escaping the first \"""
Escaping all three quotation marks \"\"\"
"""

/**
 2.3 Extended String Delimiters
 */
let test2dot3_01 = "Line 1\nLine 2"
let test2dot3_02 = #"Line 1\nLine 2"#
let test2dot3_03 = #"Line 1\#nLine 2"#
let test2dot3_04 = ###"Line 1\##nLine 3"###
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

/*
 3 Initializing an Empty String
 */

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty{
    print("Nothing to see here")
}

/*
 4 String Mutability
 */
var variableString = "horse"
variableString += "and carriage"

let constantString = "Hignlander"
//constantString += " and another Highlander"

/*
 5  Strings Are Value Types
 If you create a new String value, that String value is copied when it's passed to a function or method, or when it's assigned to a consatnt or variable.
 In each case , a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.
 Value types are described in Structures and Enumerations Are Value Types.
 */

/*
 6 Working with Characters
 */
for character in "Dog!🐶"{
    print(character)
}

let exclamtionMark: Character = "!"

let catCharacters:[Character] = ["C","a","t","!","🐱"]
let catString = String(catCharacters)
print(catString)

/*
 7 Concatenating Strings and Characters
 */
let str1 = "hello"
let str2 = " there"
var welcome = str1 + str2

var instruction = "look over"
instruction += str2

let exclaimationMark: Character = "!"
welcome.append(exclaimationMark) // why here is white，next day it is not white

let badStart = """
    1
    2w
    """
let end = """
    3
    """
print(badStart+end)

let goodStart = """
    1
    2

    """
print(goodStart+end)

/*
 8 String Interpolation
 */

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(multiplier)."#)

print(#"6 times 7 is \#( 6 * 7 )"#)

/*
 9 Unicode
 */

/**
 9.1 Unicode Scalar Values
 why do they have a name?
 */

/**
 9.2 Extended Grapheme Clusters
 */
let eAcute:Character = "\u{E9}"
let combinedEAcute:Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed:Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorForUS1: Character = "\u{1F1FA}"
let regionalIndicatorForUS2: Character = "\u{1F1F8}"

/*
 10 Counting Characters
 */
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")


/*
 11 Accessing and Modifying a String
 */

/**
    11.1    String indices
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//greeting[greeting.endIndex]

for index in greeting.indices {
    print("\(greeting[index]) ",terminator: "")
}

/**
    11.2    Inserting and Removing
 */

var welcome112 = "hello"
welcome112.insert("!", at: welcome112.endIndex)

welcome112.insert(contentsOf:" there",at: welcome112.index(before:welcome112.endIndex))


welcome112.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex,offsetBy: -6) ..< welcome.endIndex
welcome.removeSubrange(range)

/*
 12 Substring
 */

let greeting12 = "Hello, world!"
let index12 = greeting12.firstIndex(of:",") ?? greeting12.endIndex
let beginning = greeting12[..<index]

let newString = String(beginning)

/*
 13 Comparing Strings
 */

/**
  13.1  String and Character Equality
 */
let eAcuteQuestion = "Voules-vous un caf\u{E9}?"

let combinedEAcuteQuestion = "Voules-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}

/**
  13.2  Prefix and Suffix Equality
 */
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 "){
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scene in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion")
    {
        mansionCount += 1
    } 
    else if scene.hasSuffix("Friar Lawrence's cell")
    {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

/*
 14 Unicode Representations of Strings
 */

let dogString = "Dog‼🐶"

/**
 14.1 UTF-8 Representation
 */
for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator:"")
}
print("")

/**
 14.2 UTF-16 Representation
 */
for codeUnit in dogString.utf16{
    print("\(codeUnit)",terminator:"")
}
print("")

/**
  14.3 Unicode Scalar Representation
 */
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
