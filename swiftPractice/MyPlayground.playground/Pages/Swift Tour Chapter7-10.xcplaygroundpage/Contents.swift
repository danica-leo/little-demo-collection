print("debug")
// 7 Concurrency 并发
// 7.1 async
// from is input param name
// and server is inner execute name
// this param has two name
func fetchUserID(from server:String) async -> Int{
    // what is meaning of from ?
    if server == "primary"{
        return 97
    }
    return 501
}

// 7.2 await
func fetchUsername(from server:String) async -> String{
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

// 7.3 async let
func connectUser(to server:String) async {
    async let userID =  fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username),user ID \(userID)"
    print(greeting)
}

// 7.4 Task
Task {
    await connectUser(to:"primary")
}

// 7.5 task groups
// TODO: REWRITE
// TODO: here code will interrupted code execution,but I donnot know how to fix it .
// what is Int.self?
// of appears to be a fixed parameter name?
print(Int.self)
//let userIDs = await withTaskGroup(of:Int.self){ group in
//    for server in ["primary","secondary","development"] {
//        group.addTask {
//            return await fetchUserID(from:server)
//        }
//    }
//    
//    var results:[Int] = []
//    for await result in group {
//        results.append(result)
//    }
//    return results
//}
//print(userIDs)

// 7.6 actor
// TODO: donnot understand ,reread
// TODO: here code will interrupted code execution,but I donnot know how to fix it .
//actor ServerConnection {
//    var server:String = "primary"
//    private var activeUsers:[Int] = []
//    func connect() async -> Int {
//        let userID =  await fetchUserID(from:server)
//        // ... communicate with server
//        activeUsers.append(userID)
//        return userID
//    }
//}
//let server = ServerConnection()
//let userID = await server.connect()

// 8 Protocols and Extensions
// 8.1 protocol
protocol ExampleProtocol{
    var simpleDescription:String { get }
    //TODO how to write set in an entity
    var experimentDesc:String {get set}
    mutating func adjust()
}

// 8.2 adopt protocols : classes, enumerations, structures
class SimpleClass:ExampleProtocol{
    var simpleDescription: String = "A very simple class."
    var experimentDesc:String = "8.2.1 Experiment:SimpleClass"
    var anotherProperty:Int = 69105
    func adjust(){
        simpleDescription += " Now 100% adjusted."
    }
}
var a =  SimpleClass()
a.adjust()
let aDesc = a.simpleDescription

struct SimpleStruture:ExampleProtocol{
    var simpleDescription: String = "A simple structure"
    var experimentDesc:String = "8.2.1 Experiment:SimpleStruture"
    // noice the use of mutating
    mutating func adjust(){
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStruture()
b.adjust()
let bDesc = b.simpleDescription

// 8.2.1 Experiment
a.experimentDesc += "new yeah~"
a.simpleDescription += "yeah~yeah~"

// 8.3 keyword: extension
protocol ExampleProtocolInt{
    var simpleDescription:String { get }
    mutating func adjust()
}

extension Int: ExampleProtocolInt {
    var simpleDescription: String {
        return "The number \(self)"
    }
    var experimentDesc: String {
        return "This is needed"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// 8.3.1 Experiment
protocol AbsoluteProtocol{
    var absoluteValue:String {get}
}
extension Double:AbsoluteProtocol{
    var absoluteValue:String{
        var result = self
        if(result<0){
            result = -self
        }
        return "Absolute value of \(self),is \(result) "
    }
}
let doubleA:Double = -7.88
let doubleB:Double = 6.66
print(doubleA.absoluteValue)
print(doubleB.absoluteValue)

// 8.4 protocol is strict, methods outside the protocol definition aren't available
// any ExampleProtocol means that this value can be any type that comforms to the "ExampleProtocol"
let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)


// 9 Error Handling
// 9.1 Error protocol
enum PrinterError: Error{
    case outOfPaper
    case noToner
    case onFire
}

// 9.2 throws func and throw
func send(job:Int, toPrinter printerName:String) throws -> String {
    if printerName == "Never Has Toner"{
        throw PrinterError.noToner
    }
    else if printerName == "Fired!"{
        throw PrinterError.onFire
    }
    return "Job sent"
}

// 9.3 first way of handle errors - do-catch
do {
    let printerResponse =  try send(job:1040,toPrinter:"Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// 9.3.1 Experiment
do {
    let printerResponse = try send(job:333,toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// 9.4 multiple catch blocks
// 9.4.1 Experiment TODO
do {
    let printerResponse = try send(job:1440,toPrinter: "Gutenberg")
    // this line will throw an error handled by the first catch block
    let printerResErrorOfFirstCatchblock = try send(job:1404,toPrinter: "Fired")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here,with the rest of the fire")
} catch let printerError as PrinterError{
    //    named error
    print("Printer error: \(printerError)")
}catch{
    print(error)
}

