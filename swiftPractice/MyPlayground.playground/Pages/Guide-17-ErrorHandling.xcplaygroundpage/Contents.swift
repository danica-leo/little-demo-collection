/*
 1 Error Handling
 */

/*
 2 Representing and throwing errors
 */
enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

//print("test!")
//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

/*
 3 Handling Errors
 */

// 3.1 Propagating Errors Using Throwing Functions
struct Item {
    var price:Int
    var count:Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price:12, count:7),
        "Chips": Item(price:10, count:4),
        "Pretzel":Item(price:7, count:11)
    ]
    var coinsDeposited=0
    
    func vend(itemNamed name:String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice":"Chips",
    "Bob":"Licorice",
    "Eve":"Pretzels"
]

func buyFavoriteSnack(person:String, vendingMachine:VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name:String
    init(name:String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed:name)
        self.name = name
    }
}

//3.2 Handling Errors Using Do-catch
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person:"Alice",vendingMachine: vendingMachine)
    print("Success!Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error)")
}

//3.2.1
func nourish(with item:String) throws {
    do {
        try vendingMachine.vend(itemNamed:item)
    }catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
}catch{
    print("Unexpected non-vending-machine-related error:\(error)")
}

//3.2.2
func eat(item:String) throws {
    do {
        try  vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection,VendingMachineError.insufficientFunds,VendingMachineError.outOfStock{
        print("Invalid selection, out of stock, or not enough money.")
    }
}

// 3.3 Coverting Errors to Optional Values
//func fetchData() -> Data?{
//    if let data = try? fetchDataFromDisk() { return data }
//    if let data = try? fetchDataFromDatabase() { return data }
//    return nil
//}

// 3.4 Disabling Error propagation
//let photo = try! loadImage(atPath:"./xx/xxx.jpg")

/*
 4 Specifying the Error Type
 */

enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}

func summarize(_ ratings: [Int]) throws (StatisticsError) {
    guard !ratings.isEmpty else { throw .noRatings }


    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating > 0 && rating <= 3 else { throw .invalidRating(rating) }
        counts[rating]! += 1
    }


    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}
