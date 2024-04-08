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
