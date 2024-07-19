/*
 1 Error Handling
 */

/*
 2 Representing and throwing errors
 */
enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFUnds(coinsNeeded:Int)
    case outOfStock
}

print("test!")
throw VendingMachineError.insufficientFUnds(coinsNeeded: 5)

