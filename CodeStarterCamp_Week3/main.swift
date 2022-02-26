import Foundation

struct Person {
    var money: Int
    func buyCoffee() {
        print("커피를 구매합니다")
    }
}
enum Coffee: Int {
    case iceAmericano = 2500
    case cafeLatte = 3300
    case cappuccino = 3500
}
struct CoffeeShop {
    //당장 필요하지 않은 값들은 옵셔널로 표시 했습니다
    var sales: Int?
    var baristar: Person
    var coffeeMenu: Coffee?
    var pickUpTable: String?
    func takeOrder(coffee: Coffee) {
        print("\(coffee)하나 부타드립니다.")
    }
    func makeCoffee(making: Coffee) {
        print("\(making)하나 제조중입니다")
    }
}
var misterLee: Person = Person(money: 15000)
var missKim: Person = Person(money: 15000)
var yagomBucks: CoffeeShop = CoffeeShop(baristar: misterLee)
print(yagomBucks.baristar)
