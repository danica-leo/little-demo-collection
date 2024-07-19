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
