import Foundation

class Person {
    let name: String
    var money: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
       print("\(coffeeShop)에서 \(coffee)를 산다.")
    }
}

class CoffeeShop {
    let name: String
    var barista: Person!
    var menu: [Coffee: Int]!
    var revenue: Int = 0
    var isCoffeeOnPickupTable: Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    func order(_ coffee: Coffee) {
        print("\(coffee) 주문 받았습니다.")
    }
    
    func makeCoffee(_ coffee: Coffee) {
        print("\(coffee)를 만듭니다.")
    }
}

enum Coffee {
    case americano, latte, espresso, coldBrew
}

var yagombucksCoffeeMenu: [Coffee: Int] = [.americano: 4000, .coldBrew: 4500, .espresso: 3600, .latte: 4600]

let misterLee = Person(name: "misterlee")
let missKim = Person(name: "missKim", money: 10000)

var yagombucks = CoffeeShop(name: "yagombucks")
yagombucks.barista = misterLee
yagombucks.menu = yagombucksCoffeeMenu
