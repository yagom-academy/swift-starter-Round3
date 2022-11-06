import Foundation

struct Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int
    
    mutating func orderCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        
        guard let price = coffeeShop.menu[coffee] else {
            print("가격정보가 없습니다.")
            return
        }
        money -= price
        print(coffee.rawValue) // 확인용 프린트
        print(money) // 확인용 프린트
    }
    
}

struct CoffeeShop {
    var sales: Int
    var pickUpTable = [Coffee]()
    let menu: [Coffee: Int] = [.americano: 2000, .cafeLatte: 2500, .vanillaLatte: 3000, .earlGrey: 3500, .chamomile: 3500, .milkShake: 4000]
    var baristar: Person
    
    mutating func makeCoffee(takeOrder: [Coffee]) {
        for coffee in takeOrder {
            pickUpTable.append(coffee) // 확인용 프린트
        }
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case cafeLatte = "카페라떼"
    case vanillaLatte = "바닐라라떼"
    case earlGrey = "얼그레이"
    case chamomile = "캐모마일"
    case milkShake = "밀크쉐이크"
}
