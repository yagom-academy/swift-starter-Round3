import Foundation

let misterLee = Person(name: "misterLee", money: 30000)
let missKim = Person(name: "missKim", money: 3000)
let yagombucks: CoffeeShop = CoffeeShop(sales: 300000, barista: misterLee, pickUpTable: nil)

missKim.buyCoffee(.americano)

if hasAsset(of: missKim, for: .americano) == true {
     yagombucks.orderCoffee(.americano)
     yagombucks.makeCoffee(.americano)
     yagombucks.pickUp(by: missKim, coffee: .latte)
}
 
