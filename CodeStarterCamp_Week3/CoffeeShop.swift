import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case cappuccino = "카푸치노"

    var orderMenu: String {
        return self.rawValue
    }
}

class Person {
    var name: String = ""
    var money: Int = 0

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                money -= price
                print("\(name)님이 \(price)원에 \(coffee.orderMenu)를 결제했습니다.")
                coffeeShop.make(coffee, from: name)
            } else {
                print("\(name)님의 잔액이 부족하여 \(coffee.orderMenu)를 구매하실 수 없습니다.")
                print("잔액이 \(price - money)원만큼 부족합니다.")
            }
        } else {
            print("\(coffee.orderMenu)는 카페에서 판매하지 않습니다.")
        }
    }
}

class CoffeeShop {
    var shopName: String = ""
    var menu: [Coffee: Int] = [:]
    var revenue: Int = 0
    var pickUpTable: [Coffee] = []
    var barista: Person?

    func assignBarista(barista: Person) {
        self.barista = barista
        print("\(shopName)을 담당하는 바리스타는 \(barista.name)입니다.")
    }
    
    func make(_ coffee: Coffee, from name: String) {
        if let price = menu[coffee] {
            revenue += price
            pickUpTable.append(coffee)
            print("바리스타 \(barista?.name ?? "바리스타")가 \(coffee.orderMenu)를 만들어 픽업 테이블에 올려놨습니다.")
            print("\(name)님이 주문하신 \(coffee.orderMenu)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        } else {
            print("\(coffee.orderMenu)는 메뉴에 없습니다.")
        }
    }
}
