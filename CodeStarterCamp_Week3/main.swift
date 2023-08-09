import Foundation

struct Person {
    var money : Int = 10000
    func buyCoffee(coffee : Coffee) {
        print("\(coffee)를 구매하였습니다.")
    }
}
struct CoffeeShop {
    var salesRevenue : Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: Array<Coffee> = []
    var barista: Person
    func takeOrder() {

    }
    mutating func makeCoffee(coffee : Coffee) {
        print("\(coffee) 만들기 완료")
        pickUpTable.append(coffee)
    }

}
enum Coffee {
    case americano, latte, vanillaLatte, espresso
}

var misterLee = Person()
var missKim = Person()
var yagombucks = CoffeeShop(barista: misterLee)

yagombucks.makeCoffee(coffee: .americano)
print(yagombucks.pickUpTable)


