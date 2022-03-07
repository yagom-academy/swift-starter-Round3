import Foundation

missKim.buyCoffee(.americano)

if hasAsset(of: missKim, for: .americano) == true {
     yagombucks.orderCoffee(.americano)
     yagombucks.makeCoffee(.americano)
     yagombucks.pickUp(by: missKim, coffee: .latte)
}
 
