/**
 11     Numeric Literals
 */

/* 11.1 integer literal
    decimal
    binary
    octal
    hexadecimal
*/
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

/* 11.2 Floating-point literal
decimal - optional exponent - e
hexadecimal - required exponent - p
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 //真的好像乱码

/* 11.3 easy read formatting
 extra zeros
 underscores
 */
let paddedDouble = 000123.456
let oneMillion  = 1_000_000
let justOverOneMillon = 1_000_000.000_000_1

/**
 12     Numberic Type Conversion
 DONNOT HAVE DEMOS
 
    when use Int
    when use other integer types
 */

/**
 13     Integer Conversion
 */

/*
 13.1 A number that overflows will report an error.
 */
//let connotBeNegetive: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

/*
 13.2 Integer Conversion:Convert one specific number type to another
 */
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

/**
 14     Integer and Floating-Point Conversion
 */
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi)


/**
 15     Type Aliases
*/
typealias AudioSample = UInt16
var maxAmplitudeFOund = AudioSample.min

/**
 16     Booleans
 */
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty tunips!")
} else {
    print("Eww, turnips are horrible.")
}

let i = 1
//if i {
//    //this example will not compile, and will report an error
//}
if i == 1 {
    // this example will compile successfully
}


/**
 17     Tuples
 */
let http404Error = (404, "Not Found")
let (statusCode,statusMessage) = http404Error
print("code: \(statusCode),message:  \(statusMessage)")

let (justTheStatusCode,_) = http404Error
print("The status code is \(justTheStatusCode)")

print("code: \(http404Error.0),message:  \(http404Error.1)")

let http200Status = (statusCode:200, description: "OK")

print("code: \(http200Status.0),message:  \(http200Status.1)")
print("code: \(http200Status.statusCode),message:  \(http200Status.description)")
