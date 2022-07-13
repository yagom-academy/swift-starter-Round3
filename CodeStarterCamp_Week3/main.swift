import Foundation

let yagomBucksMenu: Dictionary<Coffee, Int> = [.americano: 4200,.latte: 4500, .frappucchino: 5000, .smoothe: 6000]
var missKim = Person(name: "missKim", money: 7000)
var coda = Person(name: "coda", money: 10000)
var yagomBucks = CoffeeShop(menu: yagomBucksMenu)

missKim.order(.americano, at: yagomBucks)
missKim.order(.latte, at: yagomBucks)
missKim.order(.ade, at: yagomBucks)
coda.order(.latte, at: yagomBucks)
print(missKim.money)
print(yagomBucks.sales)

