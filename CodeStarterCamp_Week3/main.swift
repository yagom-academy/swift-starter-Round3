import Foundation

//var yagombucks: CoffeeShop
//yagombucks.baristar = misterLee

var missKim: Person = .init(name: "missKim", age: 26, gender: "Woman", money: 10000)
var misterLee: Person = .init(name: "misterLee", age: 34, gender: "man", money: 3500)
var kim: Person = .init(name: "kim", age: 25, gender: "man", money: 4500)
var yagombucks: CoffeeShop = .init(sales: 50000, baristar: misterLee)

kim.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
yagombucks.makeCoffee(takeOrder: [.americano, .milkShake])
