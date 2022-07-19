import Foundation

class Person {
    var name: String
    var gender: String
    var money: Int
    
    init(name: String, gender: String, money: Int) {
        self.name = name
        self.gender = gender
        self.money = money
    }
    
    func buy(coffee: Coffee, coffeeshop: CoffeeShop) {
        if money < coffee.rawValue {
            print("잔액이 \(coffee.rawValue - money)만큼 부족합니다.")
        } else {
        coffeeshop.takeOrder(name: name, coffee: coffee)
        money = money - coffee.rawValue
}
}
}

class CoffeeShop {
    var totalSales: Int
    var pickupTable: Array<Coffee> = [Coffee]()
    var barista: Person
    
    init(barista: Person) {
        self.totalSales = 0
        self.barista = barista
    }
    
    func takeOrder(name:String, coffee:Coffee) {
        print ("\(name)님의 \(coffee)를 주문받았습니다.")
        make(coffee: coffee, name: name, totalsales: 0)
        totalSales = totalSales + coffee.rawValue
    }
    
    func make(coffee: Coffee, name: String, totalsales: Int) {
        print("\(name)님이 주문하신 \(coffee)를 만들고 있습니다.")
        pickupTable.append(coffee)
        print("\(name)님이 주문하신 \(coffee)가 준비되었습니다.")
        
    }
}

enum Coffee: Int {
    case cappucino = 5500, iceamericano = 1500, latte = 1400, cafemoca = 3000
}

let misterLee : Person = Person(name: "misterLee", gender: "male", money: 5000)
let missKim: Person = Person(name: "missKim", gender: "female", money: 3500)
let yagombucks: CoffeeShop = CoffeeShop(barista: misterLee)

missKim.buy(coffee: Coffee.cappucino, coffeeshop: yagombucks)
missKim.buy(coffee: Coffee.latte, coffeeshop: yagombucks)


