import Foundation

enum Coffee {
    case americano
    case latte
    case cappuccino
    case coldBrew
}

class Person {
    var money: Int
    var feeling: String = ""
    let name: String
    func buyThings(coffee: Coffee) {
        print("안녕하세요. \(coffee) 한 잔 주시겠어요?")
    }
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
}

class CoffeeShop {
    var sales: Int = 0
    var pickUpTable: String?
    var menu : [Coffee :Int] = [.americano : 1500, .latte : 3000, .cappuccino : 3500, .coldBrew : 4000]
    var barista: Person
    var customer: Person?
    
    func order(coffee: Coffee) {
        print("주문하신 \(coffee) 제조 중입니다.")
        print("주문하신 \(coffee) 나왔습니다.")
    }
    
    init(sales: Int,barista: Person, pickUpTable: String) {
        self.sales = sales
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
    init(sales: Int,barista: Person) {
        self.sales = sales
        self.barista = barista
    }
}

var misterLee = Person(name: "misterLee", money: 30000)
var missKim = Person(name: "missKim", money: 1000)
var yagombucks: CoffeeShop = CoffeeShop(sales: 300000, barista: misterLee)
yagombucks.barista = misterLee
