import Foundation

let missKim = Person(name: "Kim", age: 31, money: 30000)
let yagombucks = CoffeeShop(coffeeMenuWithPrice: [.americano: 4500, .capouccino: 4800, .latte: 5000])

missKim.buyCoffee(menu: .latte, size: .medium, iceOrHot: .ice, quantity: 1, at: yagombucks)
