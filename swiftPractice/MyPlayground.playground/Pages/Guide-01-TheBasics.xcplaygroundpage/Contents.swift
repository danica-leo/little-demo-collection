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

// 2.1 Type annotations
var welcomeMessage: String

// 2.2 assign type value to variable
welcomeMessage = "Hello"

