// 1.1 constants and variables
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
print("maximumNumberOfLoginAttempts:\(maximumNumberOfLoginAttempts),currentLoginAttempt:\(currentLoginAttempt)")

// 1.2 later to give it value
var environment = "development"
let maximumNumberOfLoginAttemps1:Int
if environment == "development"{
    maximumNumberOfLoginAttemps1 = 100
}else{
    maximumNumberOfLoginAttemps1 = 10
}


// 1.3 declare multiple constants or multiple variables on a single line
var x = 0.0, y = 0.0, z = 0.0

// 2 Type annotations
var welcomeMessage: String

// 2.1 assign type value to variable
welcomeMessage = "Hello"

// 2.2 define multiple related variables of the same type on a single line
var red, green, blue: Double

// 3 Naming Constants and Variables
let pi = 3.14149
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// 3.1 change variable value
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour!"

// 3.2 constant value can not change
let languageName = "Swift"
//languageName = "Swift++"

// 4 Printing Constants and Variables
print(friendlyWelcome)

// 4.1 string interpolation
print("The current value of friendlyWelcome is \(friendlyWelcome)")

// 5 Comments

// 5.1 single-line comments
/*
   5.2 multiline comments / asterisk
 */
/**
/* 5.3 nested multiline comments*/
 */

// 6 Semicolons
// does not require you to write semicolon;but are required if write multiple separate statements on a single line;


/** 7 Integers
 swift provides signed and unsigned integers in 8, 16, 32, 64 bit forms. These integers follow a naming convention similar to C.
*/
// 7.1 integer bounds
let minValue = UInt8.min
let maxValue = UInt8.max

// 7.2 Int: Addtional integer type, has the same size as the current platform's native word size:
// 7.3 UInt：Addtional unsigned integer type, use it only when you specifically need. even when the values to be stored are known to be nonnegative

/** 9 Floating-Point Numbers :  Double( 64 bit ) , Float( 32 bit )
    Double: at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits.
    In situation where either type would be appropriate , Double is preferred.
*/

/**
   10 Type Safety and Type Inference
Swift always choose Double (rather than Float) when inferring the type of  floating-point numbers
Swift always infers that a constant, which appears as a number resebling an integer, is an Int.
 */
let meaningOfLife = 42
let pi2 = 3.14159
let anotherPi = 3 + 0.14159

