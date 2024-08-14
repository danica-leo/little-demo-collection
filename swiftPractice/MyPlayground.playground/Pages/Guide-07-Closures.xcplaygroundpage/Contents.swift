
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

