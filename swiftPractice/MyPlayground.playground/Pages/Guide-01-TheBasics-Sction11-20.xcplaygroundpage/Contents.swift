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

