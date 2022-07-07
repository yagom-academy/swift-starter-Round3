import Foundation

struct Person {
    var name: String
    var gender: String
    var money: Int
    
    func buyCoffee() {
        print("커피를 구매합니다.")
    }
}

class Coffeeshop {
    var totalSales: Int
    var barista: Person
    enum MenuBoard: Int {
        case espresso = 3500, americano = 1500, caffeLatte = 4000, cappuccino = 4500
    }
    var pickupTable: Array<Coffee> = [Coffee]()
    init(barista: Person){
        self.totalSales = 0
        self.barista = barista
    }
    func takeOrder() {
        print("주문을 받았습니다.")
    }
    func makeCoffee(x: Coffee) {
        print("커피를 만들고 있습니다.")
        pickupTable.append(x)
    }
}

enum Coffee{
    case espresso, americano, caffeLatte, cappuccino
}

let misterLee: Person = Person(name: "misterLee", gender: "male", money: 5000)

let missKim: Person = Person(name: "missKim", gender: "female", money:3500)

let yagombucks: Coffeeshop = Coffeeshop(barista: misterLee)
