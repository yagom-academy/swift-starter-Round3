import Foundation

enum Coffee {
    case americano, latte, frappucchino, smoothe, ade
    
    var koreanName: String {
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
    var name: String,
        money: Int
    
    mutating func order(_ coffee: Coffee, at coffeeShop: CoffeeShop) {
        guard let price: Int = coffeeShop.menu[coffee] else {
            print("주문이 불가능한 음료입니다")
            return
        }
        
        if price <= self.money {
            self.money -= price
            coffeeShop.make(coffee, from: self.name)
        } else {
            print("잔액이 \(price-self.money)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var sales: Int = 0,
        menu: Dictionary<Coffee, Int>
    var pickUpTable: (orderer: String, coffee: Coffee)? {
        didSet{
            guard let orderer = pickUpTable?.0,
                  let coffee = pickUpTable?.1 else {
                return print("픽업대는 비어있습니다")
            }
            print("\(orderer)님이 주문하신 \(coffee.koreanName)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
    }
    
    init (menu: Dictionary<Coffee, Int>) {
        self.menu = menu
    }
    
    func make(_ coffee: Coffee, from name: String) {
        guard let price: Int = self.menu[coffee] else {
            print("저희 카페에서 취급하지 않는 음료입니다")
            return
        }
        self.sales += price
        self.pickUpTable = (name, coffee)
    }
}

