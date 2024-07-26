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

/*
 3 Function Parameters and Return Values
 */

/**
 3.1 Functions With Out Parameters
 */
func sayHelloWorld() -> String {
    return "Hello world!"
}

print(sayHelloWorld())

/**
 3,2 Functions with  multiple parameters
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
 3.3 Functions without return values
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

func printWithoutCounting(str:String){
    let _ = printAndCount(str:str)
}

printAndCount(str: "Hello, world!")
printWithoutCounting(str: "Hello, world!")

/**
 3.4 Functions with multiple parameters
 */
func minMax(array:[Int]) -> (min:Int, max:Int)?{
    guard !array.isEmpty else {
        return nil
    }

    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let  bounds = minMax(array:[8, -6, 2, 109, 3, 71]){
    print("min is \(bounds.min) and max is \(bounds.max)")

}

/**
 3.5 Functions with an implicit return
 */
func greeting35(for person:String)-> String {
    "Hell, " + person + "!"
}
print(greeting35(for:"Dave"))

/*
 4 Function Argument Labels and Parameter Names
 */



// 4.1 Specifying Argument Labels
func greet41(person:String, from hometown:String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet41(person: "Bill", from:"Cupertino"))

// 4.2 Omitting Argument Labels
func sayBye(_ name:String,_ hometown:String )->String{
    return "Goodbye! \(name)! go to \(hometown)"
}
print(sayBye("Glle!","TianJing"))


// 4.3 Default Parameter Values
func saySunny(_ name:String = "Friends"){
    print("\(name), Today is Sunny!")
}

// 4.4 Variadic Parameters

func arithmeticMean(_ numbers:Double...) -> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)
arithmeticMean(3,8.25,18.75)

// 4.5 In-Out Parameters
func swapTwoInts(_ a:inout Int, _ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


/*
 5 Function Types
 */
