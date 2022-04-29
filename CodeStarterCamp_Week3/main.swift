import Foundation

struct Person {
    let name: String
    var money: Int {
        willSet {
            print("주문 전 나의 돈 \(self.money)")
        }
        didSet {
            print("주문 후 나의 돈 \(self.money)")
        }
    }

    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
    
    mutating func buyCoffee(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        guard let coffeePrice = coffeeShop.menu[coffee] else {
            print("없는 메뉴")
            return
        }
        
        if coffeePrice > money {
            print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
        } else {
            print("\(coffeeShop.name)에서 \(coffee)를 주문합니다.")
            self.money -= coffeePrice
            coffeeShop.order(coffee, by: self.name)
        }
    }
}

class CoffeeShop {
    let name: String
    var customerName: String = ""
    let barista: Person
    let menu: [Coffee: Int]
    var revenue: Int = 0
    var pickUpTable: Coffee? = nil {
        didSet {
            print("\(customerName)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init(name: String, barista: Person, menu: [Coffee: Int]) {
        self.name = name
        self.barista = barista
        self.menu = menu
    }
    
    func order(_ coffee: Coffee,  by name: String) {
        self.customerName = name
        
        guard let coffeePrice = self.menu[coffee] else {
            print("주문하신 메뉴는 없는 메뉴입니다.")
            return
        }
        self.revenue += coffeePrice
        print("\(coffee) 주문 받았습니다.")
        makeCoffee(coffee, for: name)
    }
    
    func makeCoffee(_ coffee: Coffee, for name: String) {
        print("\(self.barista.name)가 \(coffee)를 만듭니다.")
        self.pickUpTable = coffee
    }
}

enum Coffee {
    case americano, latte, espresso, coldBrew
}

let misterLee = Person(name: "misterlee")
var missKim = Person(name: "missKim", money: 10000)

let yagombucksCoffeeMenu: [Coffee: Int] = [.americano: 4000, .coldBrew: 4500, .espresso: 3600, .latte: 4600]
let yagombucks = CoffeeShop(name: "yagombucks", barista: misterLee, menu: yagombucksCoffeeMenu)

missKim.buyCoffee(.latte, at: yagombucks)
