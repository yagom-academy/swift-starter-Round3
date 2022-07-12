import Foundation

let yagombucksMenu: Dictionary<Coffee, Int> = [.americano: 4200, .latte: 4500, .frappucchino: 5000, .smoothe: 6000]
var misterLee = Person(money: 50000)
var missKim = Person(money: 100000)
var yagombucks = CoffeeShop(barista: misterLee, menu: yagombucksMenu)
                            
misterLee.name = "leeJoo"
misterLee.age = 25
misterLee.buy("bread", for: 3800)
misterLee.buy("ticket", for: 55000)
yagombucks.takeOrder(.americano)


