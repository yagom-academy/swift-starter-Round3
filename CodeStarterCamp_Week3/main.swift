import Foundation

enum Coffee: Int {
    case iceAmericano = 2500
    case cafeLatte = 4300
    case cappuccino = 4800
}
class CoffeeShop {
    var sales: Int
    var coffeeMenu : Coffee?
    var pickUpTable: String = ""
    init(sales: Int) {
        self.sales = sales
    }
    func takeOrder(coffee: Coffee, person: Person) {
        print("\(coffee) 주문받았습니다")
    }
    func makeCoffee(making: Coffee) {
        print("\(making) 제조중입니다")
    }
}
class Person: CoffeeShop {
    
    var money: Int
    var name: String
    init(money: Int, name: String) {
        self.money = money
        self.name = name
        super.init(sales: 0)
    }
    func buyCoffee(coffee: Coffee) {
        print("\(coffee) 부탁드립니다")
    }
    override func takeOrder(coffee: Coffee, person: Person) {
        buyCoffee(coffee: coffee)
        super.takeOrder(coffee: coffee, person: person)
        // 값 들을 편하게 연산하기 위해 상수로 정의 해 봤습니다.
        let missMoney: Int = person.money
        let yagomMoney: Int = yagomBucks.sales
        let coffeePrice: Int = coffee.rawValue
        print("\(name) 잔액 : \(missMoney-coffeePrice)원, yagomBucks매출액 : \(yagomMoney + coffeePrice)원")
        missKim.pickUpTable = "\(name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요."
        missLee.pickUpTable = "\(name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요."
        if missMoney < coffeePrice {
            print("잔액이 \(coffeePrice-missMoney)원 만큼 부족합니다")
        } else if missMoney >= coffeePrice {
            super.makeCoffee(making: coffee)
            print("\(pickUpTable)")
        }
    }
}
var missKim: Person = Person(money: 3000, name: "missKim")
var missLee: Person = Person(money: 3000, name: "missLee")
var yagomBucks: CoffeeShop = CoffeeShop(sales: 2000)
//두 결과를 확인하기 위해 두 값을 출력 해 봤습니다.
missKim.takeOrder(coffee: .cappuccino, person: missKim)
print("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ")
missLee.takeOrder(coffee: .iceAmericano, person: missLee)
