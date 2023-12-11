import UIKit

// Coffee 열거형 정의
enum Coffee {
    case americano
    case latte
    case cappuccino
    // 다른 커피 종류들도 추가할 수 있습니다.
}

// Person 클래스 정의
class Person {
    var money: Int = 0
    
    // 커피를 구매하는 메서드
    func buyCoffee(from shop: CoffeeShop, type: Coffee) {
        shop.takeOrder(customer: self, coffeeType: type)
    }
}

// CoffeeShop 클래스 정의
class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee: Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    // 주문을 받고 커피를 만들어내는 메서드
    func takeOrder(customer: Person, coffeeType: Coffee) {
        guard let price = menu[coffeeType], customer.money >= price else {
            print("주문이 올바르지 않거나 돈이 부족합니다.")
            return
        }
        
        // 주문 성공
        customer.money -= price
        sales += price
        makeCoffee(type: coffeeType)
    }
    
    // 커피를 만들어내고 픽업 테이블에 놓는 메서드
    func makeCoffee(type: Coffee) {
        pickUpTable.append(type)
        print("\(type)이(가) 준비되었습니다. 픽업 테이블에서 수령해주세요.")
    }
}

// 인스턴스 생성
let misterLee = Person()
let missKim = Person()

let yagombucks = CoffeeShop()
yagombucks.menu = [.americano: 1500, .latte: 2000, .cappuccino: 2500]

// 바리스타 할당
yagombucks.barista = misterLee

// 테스트
misterLee.money = 5000
missKim.money = 3000

misterLee.buyCoffee(from: yagombucks, type: .latte)
missKim.buyCoffee(from: yagombucks, type: .cappuccino)

// 결과 확인
print("misterLee의 남은 돈: \(misterLee.money)")
print("missKim의 남은 돈: \(missKim.money)")
print("yagombucks의 매출액: \(yagombucks.sales)")
print("픽업 테이블에 있는 커피: \(yagombucks.pickUpTable)")

