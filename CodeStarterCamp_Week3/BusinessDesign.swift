import Foundation

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int){
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee) {
        print("\(name)이(가) \(coffee)를 주문했습니다.")
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
    
    func takeOrder(consumer: Person, coffee: Coffee, barista: Person) {
        if let price = menu[coffee] {
            if consumer.money < price {
                print("잔액이 \(price - consumer.money)원만큼 부족합니다.")
            } else {
                consumer.order(coffee)
                consumer.money -= price
                sales += price
                makeCoffee(consumer, coffee, barista)
            }
        }
    }
    
    func makeCoffee(_ consumer: Person, _ coffee: Coffee, _ barista: Person) {
        print("\(barista.name)이 커피를 만들고 있습니다.")
        pickUpTable = coffee
        print("\(consumer.name) 님의 커피가 준비되었습니다. 픽업대에서 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노", latte = "라떼", cafeMocha = "카페모카", iceChoco = "아이스초코"
}

