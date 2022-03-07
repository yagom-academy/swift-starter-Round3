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
    var customerName: Person
    // 변수를 밖으로 뺴내어 함수가 종료되어도 매모리애서 제거 되지 않도록 설정하고, 옵셔널 값으로 설정해 커피가 없을 수도 있도록 해 봤습니다
    var pickUpTable: Coffee? {
        didSet {
            if let readyCoffee = pickUpTable {
                print("\(customerName.name)님의  \(readyCoffee)가 준비 되었습니다 픽업대에서 가져가 주시길 바랍니다!")
            }
        }
    }
    // Person타입에 있는 checkMoney함수를 활용 하는 방법 힌트가 조금 있을까요??ㅎㅎ;;
    func takeOrder(coffee: Coffee, person: Person, coffeeShop: CoffeeShop) {
        person.checkMoney(coffee: coffee, person: person)
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
var yagomBucks: CoffeeShop = CoffeeShop(sales: 50000, baristar: misterLee, customerName: missKim)

// 통합 함수를 제거하고 각 메소드를 실행 시켜봤습니다!
missKim.checkMoney(coffee: .cappuccino  , person: missKim)
missKim.orderCoffee(coffee: .cappuccino, person: missKim)
yagomBucks.takeOrder(coffee: .cappuccino, person: missKim, coffeeShop: yagomBucks)
yagomBucks.makeCoffee(coffee: .cappuccino, person: missKim)
