import Foundation

enum Coffee {
    case americano, latte, frappucchino, smoothe, ade
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
        barista: Person?,
        menu: Dictionary<Coffee, Int>? = [:],
        pickUpTable: Array<Coffee>? = []
    
    mutating func takeOrder(_ coffee: Coffee) {
        if let price: Int = menu?[coffee] {
            print("\(coffee)를 주문받았습니다")
            self.make(coffee)
            sales = sales + price
        }
    }
    
    mutating func make(_ coffee: Coffee) {
        pickUpTable?.append(coffee)
        print("픽업대에 주문하신 \(coffee)가 준비되었습니다")
    }
}
