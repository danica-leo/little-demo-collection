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
