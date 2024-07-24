/*
 1 Functions
 */

/*
 2 Defining and Calling Functions
 */

func greet(person:String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person:"Anna"))
print(greet(person:"Brian"))

func greetAgain(person:String) -> String {
    return "Hell0, \(person)!"
}

print(greetAgain(person:"Danica"))

/**
 2.1 Function Parameters and Return Values
 */

