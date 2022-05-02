import Foundation

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func order(coffee: Coffee, at coffeeShop: CoffeeShop) {
        print("\(name)이(가) \(coffee)를 주문했습니다.")
        coffeeShop.takeOrder(coffee: coffee)
    }
}

class CoffeeShop {
    var sales = 0
    var consumer: Person
    var barista: Person
    var pickUpTable: Coffee?
    let menu: [Coffee: Int] = [.americano: 3000, .latte: 4000, .cafeMocha: 5000, .iceChoco: 10000]

    init(consumer: Person, barista: Person) {
        self.consumer = consumer
        self.barista = barista
    }
    
    func takeOrder(coffee: Coffee) {
        guard let price = menu[coffee] else {
            print("메뉴에 없는 주문입니다.")
            return
        }
        
        if price <= consumer.money {
            print("주문이 완료되었습니다.")
            consumer.money -= price
            sales += price
            makeCoffee(name: consumer.name, coffee: coffee)
        } else {
            print("잔액이 \(price - consumer.money)원만큼 부족합니다.")
        }
    }
    
    func makeCoffee(name: String, coffee: Coffee) {
        print("\(barista.name)이 커피를 만들고 있습니다.")
        pickUpTable = coffee
        print("\(name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cafeMocha = "카페모카", iceChoco = "아이스초코"
}

