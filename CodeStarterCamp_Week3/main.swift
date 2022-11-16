
import Foundation

struct Person {
    var name: String
    var gender: String
    var age: Int
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        if let price = coffeeShop.menu[coffee] {
            if money >= price {
                money = money - price
                print("커피 가격은 \(price)원이고 남은 돈 \(money)원 입니다.")
            } else {
                print("돈이 부족하여 커피를 구매할 수 없습니다.")
            }
            
        }
    }
}


class CoffeeShop {
    var shopName: String
    var revenue: Int?
    var barista: Person
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [String] = []
    
    func makeCoffee(ordererName: String, coffee: Coffee) {
        pickUpTable.append("\(coffee)")
        for num in 0...(pickUpTable.count - 1) {
            print("\(ordererName)님 주문하신 \(pickUpTable[num]) 나왔습니다.")
            pickUpTable.removeAll()
        }
    }
    
    init(shopName: String, barista: Person, pickUpTable: [String]) {
        self.shopName = shopName
        self.barista = barista
        self.pickUpTable = pickUpTable
        for coffee in Coffee.all {
            menu[coffee] = coffee.rawValue
        }
    }
}

enum Coffee: Int {
    case americano = 1000
    case latte = 2000
    case ade = 3000
    case smoothie = 4000
    static let all = [americano, latte, ade, smoothie]
}


var misterLee: Person = Person(name: "misterLee", gender: "male", age: 28, money: 30000)
var missKim: Person = Person(name: "missKim", gender: "female", age: 21, money: 20000)
var yagombucks: CoffeeShop = CoffeeShop(shopName: "yagombucks", barista: misterLee, pickUpTable: [])

misterLee.orderCoffee(coffeeShop: yagombucks, coffee: .americano)
yagombucks.makeCoffee(ordererName: misterLee.name, coffee: .americano)
