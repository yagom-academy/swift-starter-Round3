import Foundation

var missKim: Person = .init(name: "missKim", age: 26, gender: "Woman", money: 10000)
var misterLee: Person = .init(name: "misterLee", age: 34, gender: "man", money: 3500)
var misterPark: Person = .init(name: "misterPark", age: 25, gender: "man", money: 1500)
var yagombucks: CoffeeShop = .init(sales: 50000, coffee: .unselect, baristar: misterLee)

missKim.order(coffee: .cafeLatte, coffeeShop: yagombucks)
misterPark.order(coffee: .milkShake, coffeeShop: yagombucks)
yagombucks.make(coffee: .americano, from: "misterLee")
