import Foundation

class Person {
    let name: String
    let age: Int
    let money: Int

    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }

    func buyCoffee() {
        print("bought Coffee")
    }
}

class CoffeeShop {
    var sales: Int = 0
    var coffeeMenuWithPrice: [CoffeeMenu: Int]
    var barista: Person
    var pickUpTable: CoffeeMenu? {
        didSet {
            if let menu = self.pickUpTable {
                print("주문하신 \(menu.rawValue) 픽업테이블 위에 있습니다~")
            }
        }
    }

    init(coffeeMenuWithPrice: [CoffeeMenu: Int], barista: Person) {
        self.coffeeMenuWithPrice = coffeeMenuWithPrice
        self.barista = barista
    }

    func getOrder(menu: CoffeeMenu, size: Size, iceOrHot: IceOrHot, quantity: Int) {
        var price: Int = 0
        if let defaultPrice = coffeeMenuWithPrice[menu] {
            price = (defaultPrice + size.rawValue + iceOrHot.rawValue) * quantity
        }
        print("감사합니다 주문하신 음료 총 가격은 \(price)원 입니다~")
    }

    func makeCoffee() {
        print("making Coffee")
    }
}

enum CoffeeMenu: String {
    case americano = "아메리카노"
    case capouccino = "카푸치노"
    case latte = "라떼"
}

enum Size: Int {
    case small = 0
    case medium = 500
    case large = 1000
}

enum IceOrHot: Int {
    case ice = 300
    case hot = 0
}

let misterLee = Person(name: "Lee", age: 26, money: 10000)
let missKim = Person(name: "Kim", age: 31, money: 15000)

let yagombucks = CoffeeShop(coffeeMenuWithPrice: [.americano: 4500, .capouccino: 4800, .latte: 5000], barista: misterLee)
