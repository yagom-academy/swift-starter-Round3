import UIKit


class Person {
    var money: Int = 0
    func buyCoffee(from shop: inout CoffeeShop, type: CoffeeShop.Coffee) {
        shop.takeOrder(customer: self, coffeeType: type)
    }
}

struct CoffeeShop {
    enum Coffee: String {
        case espresso
        case americano
        case cafeLatte
        case cappuchino
        case machiatto
        case cafeMocha
    }
    
    var sales: Int
    var menu: [Coffee: Int]
    var barista: Person?
    
    var pickUpTable: [String] = []
    
    // 커피 주문 메소드
    mutating func takeOrder(customer: Person, coffeeType: Coffee) {
        guard let price = menu[coffeeType] else {
            print("주문이 올바르지 않습니다.")
            return
        }
        if customer.money >= price {
            brewUpCoffee(type: coffeeType)
            sales += Int(price)
        } else {
            print("돈이 부족합니다.")
        }
    }
    // 커피 제조 메소드
    mutating func brewUpCoffee(type: CoffeeShop.Coffee) {
        pickUpTable.append(type.rawValue)
        print("\(type)이(가) 준비되었습니다.")
    }
}

let misterLee = Person()
let missKim = Person()

var yagomBucks = CoffeeShop(
    sales: 0,
    menu: [.americano: 4000, .espresso: 3500, .cafeLatte: 4500],
    barista: misterLee,
    pickUpTable: []
)

missKim.money = 10000
missKim.buyCoffee(from: &yagomBucks, type: .americano)
