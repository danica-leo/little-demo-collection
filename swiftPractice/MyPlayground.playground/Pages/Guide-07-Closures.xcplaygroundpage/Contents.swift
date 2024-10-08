
/*
 1 Closures
 */


/*
 2 Closure Expression
 */

/**
 2.1 The sorted methods
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by:backward)

/**
 2.2 Closure Expreesiong Syntax
 */
reversedNames = names.sorted(by:{(_ s1:String,_ s2:String) -> Bool in return s1 > s2 })


/**
 2.3 Inferring Type From Context
 */
reversedNames = names.sorted(by:{ s1, s2 in return s1 > s2})


/**
  2.4 Implicit Returns from Single-Expression Closures
*/

reversedNames = names.sorted(by:{ s1, s2 in s1 > s2 })


/**
  2.5 Shorthand Argument Names
*/

reversedNames = names.sorted(by:{ $0 > $1 })

/**
  2.6 Operator Methods
*/

reversedNames = names.sorted(by: >)


/*
 3 Trailing Closures
 */
reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16,58,510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


func loadPicture(from server:String,completion:(String)->Void,onFailure:()->Void){
    let success = false
    if(success){
        completion("success!")
    }else{
        onFailure()
    }
}

loadPicture(from: "Server 1"){ picture in
    print("Server 1 picture")
} onFailure: {
    print("Couldn't download the next picture")
}


/*
 4 Capturing Values
 */

func makeIncrementer(forIncrement amount:Int) -> ()->Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementer4_1 = makeIncrementer(forIncrement: 10)
incrementer4_1()
incrementer4_1()
incrementer4_1()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementer4_1()

/*
  5 Closures Are Reference Types
*/

let alsoIncrementByTen = incrementer4_1
incrementer4_1()
incrementer4_1()

/*
  6 Escaping Closures
*/

var completionHandlers:[()->Void] = []
func someFunctionWithEscapingClosure(completionHandler:@escaping ()->Void ){
  completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure:()->Void){
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 200 }
        someFunctionWithNonescapingClosure { x = 100 }
    }
}

let someInstance = SomeClass()
print(someInstance.x)

someInstance.doSomething()
print(someInstance.x)

completionHandlers.first?()
print(someInstance.x)

class SomeOtherClass {
    var x = 22
    func doSomething() {
        someFunctionWithEscapingClosure {[self] in x = 222}
        someFunctionWithNonescapingClosure { x = 111 }
    }
}

let someOtherInstance = SomeOtherClass()
print(someOtherInstance.x)

someOtherInstance.doSomething()
print(someOtherInstance.x)

completionHandlers[1]()
print(someOtherInstance.x)

/*
 7 AutoClosures
 */
var customerLines = ["Chris", "Alex", "Ewa", "Barry", "Deniella"];
print(customerLines.count)

let customerProvider = { customerLines.remove(at: 0) }
print(customerLines.count)

print("Now serving \(customerProvider())!")
print(customerLines.count)


func serve(customer customerProvider:() -> String){
  print("Now serving \(customerProvider())!")
}
serve(customer:{ customerLines.remove(at:0)})
print(customerLines.count)

func serve2(customer customerProvider:@autoclosure () -> String) {
  print("Now serving \(customerProvider())!")
}
serve2(customer: customerLines.remove(at: 0))

var customerProviders:[()->String] = []
func collectCustomerProviders(_ customerProvider:@autoclosure @escaping ()->String){
  customerProviders.append(customerProvider)
}
collectCustomerProviders(customerLines.remove(at:0))
collectCustomerProviders(customerLines.remove(at:0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders{
  print("Now serving \(customerProvider())!")
}
