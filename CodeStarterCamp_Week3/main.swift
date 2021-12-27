import Foundation

enum Coffee{
    case americano, cafeLatte, espresso
}

struct Person {
    var money: Int = 0

    func buy(product: String) {
        print(product + "를 구매하였습니다.")
    }
}

struct CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee : Int] = [.americano : 2500, .cafeLatte : 3000, .espresso : 4000]
    var pickUpTable: String?
    var barista: Person = Person()

    func takeOrderMake(coffee: Coffee) {
        print("\(coffee)를 주문 받았습니다.")
        print("주문하신 \(coffee)나왔습니다.")
    }
}

var misterLee: Person = Person(money: 10000)
var missKim: Person = Person(money: 30000)
var yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee
