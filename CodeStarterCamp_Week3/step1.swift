import Foundation

enum Coffee {
    case americano, latte, frappucchino, smoothe, ade
    
    var name: String {
        switch self {
        case .americano:
            return "아메리카노"
        case .latte:
            return "라떼"
        case .frappucchino:
            return "프라푸치노"
        case .smoothe:
            return "스무디"
        case .ade:
            return "에이드"
        }
    }
}

struct Person {
    var name: String?,
        age: Int?,
        money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    mutating func buy(_ something: String, for price: Int){
        if money < price {
            print ("돈이 부족합니다")
        }
        else {
            print("\(something)를 \(price)원에 구매했습니다")
            money = money - price
        }
    }
}

struct CoffeeShop {
    var sales: Int = 0,
        barista: Person,
        menu: Dictionary<Coffee, Int> = [:],
        pickUpTable: Array<Coffee> = []
    
    mutating func takeOrder(_ coffee: Coffee) {
        guard let price: Int = menu[coffee] else {
            print("죄송하지만 \(coffee.name)는 저희 매장에서 취급하지 않는 음료입니다")
            return
        }
        print("\(coffee.name)를 주문받았습니다")
        make(coffee)
        sales = sales + price
    }
    
    mutating func make(_ coffee: Coffee) {
        pickUpTable.append(coffee)
        print("픽업대에 주문하신 \(coffee.name)가 준비되었습니다")
    }
}
