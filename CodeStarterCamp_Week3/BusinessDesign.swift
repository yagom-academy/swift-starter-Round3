import Foundation

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func order(coffee: Coffee, at coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("메뉴에 없는 주문입니다.")
            return
        }
        if price <= money {
            print("\(name)이(가) \(coffee)를 주문했습니다.")
            money -= price
            coffeeShop.takeOrder(name: name, coffee: coffee, pay: price)
        } else {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        }
    }
}

class CoffeeShop {
    var sales = 0
    var barista: Person
    var pickUpTable: Coffee?
    let menu: [Coffee: Int] = [.americano: 3000, .latte: 4000, .cafeMocha: 5000, .iceChoco: 10000]

    init(barista: Person) {
        self.barista = barista
    }
    
    func takeOrder(name customerName: String, coffee: Coffee, pay: Int) {
        print("커피샵: \(coffee.rawValue) 주문이 들어왔습니다.")
        sales += pay
        makeCoffee(customerName: customerName, coffee: coffee)
    }
    
    func makeCoffee(customerName: String, coffee: Coffee) {
        print("커피샵: \(barista.name) 바리스타가 커피를 만들고 있습니다.")
        pickUpTable = coffee
        print("커피샵: \(customerName) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cafeMocha = "카페모카", iceChoco = "아이스초코"
}

