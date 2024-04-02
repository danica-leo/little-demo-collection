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
