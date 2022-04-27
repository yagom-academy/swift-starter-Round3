import Foundation

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
       print("\(coffeeShop)에서 \(coffee)를 산다.")
    }
}

struct CoffeeShop {
    let name: String
    let barista: Person
    let menu: [Coffee: Int]
    var revenue: Int = 0
    var PickupTable: Coffee? = nil
    
    init(name: String, barista: Person, menu: [Coffee: Int]) {
        self.name = name
        self.barista = barista
        self.menu = menu
    }
    
    func order(_ coffee: Coffee) {
        print("\(coffee) 주문 받았습니다.")
    }
    
    func makeCoffee(_ coffee: Coffee) {
        print("\(self.barista)가 \(coffee)를 만듭니다.")
    }
}

enum Coffee {
    case americano, latte, espresso, coldBrew
}

let yagombucksCoffeeMenu: [Coffee: Int] = [.americano: 4000, .coldBrew: 4500, .espresso: 3600, .latte: 4600]

let misterLee = Person(name: "misterlee")
let missKim = Person(name: "missKim", money: 10000)

let yagombucks = CoffeeShop(name: "yagombucks", barista: misterLee, menu: yagombucksCoffeeMenu)
