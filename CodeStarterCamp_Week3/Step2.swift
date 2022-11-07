import Foundation

struct Person {
    var name: String
    var age: Int
    var gender: String
    var money: Int
    
    mutating func order(coffee: Coffee, coffeeShop: CoffeeShop) { // 이것을 통해 yagombucks의 make 메서드를 호출
        
        guard let price = coffeeShop.menu[coffee] else {
            print("가격정보가 없습니다.")
            return
        }
        
        if money >= price {
            money -= price
            print("\(name)님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요")
        } else {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        }
    }
    
}

struct CoffeeShop {
    var sales: Int
    var pickUpTable = [Coffee]()
    let menu: [Coffee: Int] = [.americano: 2000, .cafeLatte: 2500, .vanillaLatte: 3000, .earlGrey: 3500, .chamomile: 3500, .milkShake: 4000]
    var baristar: Person
    
    mutating func make(coffee: Coffee, from name: String, customer: inout Person) {
        pickUpTable.append(coffee) // 확인용 프린트
        
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
