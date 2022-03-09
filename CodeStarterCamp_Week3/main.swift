import Foundation

struct Person {
    var money: Int
    var name: String
    // 커피샵에서 커피 주문이 가능한지 먼저 가진 소지액을 체크하는 함수
    func checkMoney(coffee: Coffee, person: Person) {
        if person.money < coffee.rawValue {
            print("\(person.name)잔액이 {\(coffee.rawValue-person.money)}원만큼 부족합니다.(주문불가)")
        }
    }
    // 체크한 돈이 있다면 주문이 가능한 함수 구현
    func orderCoffee(coffee: Coffee, person: Person) {
        if person.money >= coffee.rawValue {
            print("소지액 : \(person.money). \(coffee)하나 주문할게요")
            print("\(person.name)의 남은 잔액 : \(person.money-coffee.rawValue)원")
        }
    }
}
struct CoffeeShop {
    var sales: Int
    var baristar: Person
    var customer: Person
    var pickUpTable: Coffee? {
        didSet {
            if let readyCoffee = pickUpTable {
                print("\(customer.name)님의  \(readyCoffee)가 준비 되었습니다 픽업대에서 가져가 주시길 바랍니다!")
            } else  {
                print("커피를 올려주세요")
            }
        }
    }
    
    // 커피샵에서 주문을 받고 매출액을 계산하는 함수 구현
    func takeOrder(coffee: Coffee, person: Person, coffeeShop: CoffeeShop) {
        person.checkMoney(coffee: coffee, person: person)
        person.orderCoffee(coffee: coffee, person: person)
        if coffee.rawValue <= person.money {
            // 원래 매출액에 커피값을 더해서 총 매출액을 작성해 봤습니다
            print("주문이 완료 되었습니다.(금일 매출액 : \(coffeeShop.sales)원 +\(coffee.rawValue)원, 총매출액 : \(coffeeShop.sales+coffee.rawValue)원)")
        }
    }
    // 주문받은 커피를 제조하고 픽업 테이블에 올리는 함수 구현
    mutating func makeCoffee(coffee: Coffee, person: Person) {
        // 프로퍼티 감시자를 사용하여 값이 나오게 해 봤는데 이렇게 작성이 되는건지 좀 헷갈리는 부분입니다.
        if  coffee.rawValue <= person.money {
            print("주문받은 \(coffee) 제조 하겠습니다")
            pickUpTable = coffee
        }
    }
}
enum Coffee: Int {
    case iceAmericano = 3000
    case cafeLatte = 4000
    case cappuccino = 5000
}
let misterLee: Person = Person(money: 0, name: "misterLee")
let missKim: Person = Person(money: 5000, name: "missKim")
var yagomBucks: CoffeeShop = CoffeeShop(sales: 50000, baristar: misterLee, customer: missKim)

yagomBucks.takeOrder(coffee: .cappuccino, person: missKim, coffeeShop: yagomBucks)
yagomBucks.makeCoffee(coffee: .cappuccino, person: missKim)
