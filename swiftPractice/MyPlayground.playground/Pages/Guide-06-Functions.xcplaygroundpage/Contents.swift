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
    return "Hello again, \(person)!"
}

print(greetAgain(person:"Danica"))

/**
 2.1 Function Parameters and Return Values
 */

/**
 2.2 Functions With Out Parameters
 */
func sayHelloWorld() -> String {
    return "Hello world!"
}

print(sayHelloWorld())

/**
 2.3 Functions with  multiple parameters
 */
func greet(person:String,alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
    
}
print(greet(person: "David",alreadyGreeted:true))


/**
 2.4 Functions without return values
 */

func greet24(person:String){
    print("Hooooh, hello \(person)!")
}
//let result24 = greet24(person: "Dave")
//print("result24: \(result24)")

func printAndCount(str:String) -> Int {
    print(str)
    return str.count
}

func printWithoutCounting(str2:String) -> Int{
    let _ = printAndCount(str:str2)
}
/**
 2.5 Functions with multiple parameters
 */

/**
 2.6 Functions with an implicit return
 */
