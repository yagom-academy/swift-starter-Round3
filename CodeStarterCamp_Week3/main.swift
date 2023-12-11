//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by Nat Kim on 2023/12/11.
//

import Foundation

// MARK: STEP2

struct Person {
    enum Role: String {
        case customer
    }
    var customer: Role
    var money: Int
    
    mutating func order(_ coffee: Coffee, of coffeeShop: inout CoffeeShop,
                        by name: String) {
        guard let price: Int = coffeeShop.menu[coffee] else {
            print("판매하지 않는 커피 종류입니다.")
            return
        }
        if money >= price {
            coffeeShop.make(coffee, for: name)
            money -= price
        } else {
            let shortageAmount = price - money
            print("잔액이 \(shortageAmount)원만큼 부족합니다.")
        }
    }
}



enum Coffee: String {
    case espresso   = "에스프레소"
    case americano  = "아메리카노"
    case cafeLatte  = "카페라떼"
    case cappuchino = "카푸치노"
    case machiatto  = "마키아또"
    case cafeMocha  = "카페모카"
}

struct CoffeeShop {
    
    var sales: Int // 카페의 매출액
    var menu: [Coffee: Int]
    
    var pickUpTable: String? = ""

    // 커피 제조 메소드
    mutating func make(_ coffee: Coffee, for name: String) {
        guard let price: Int = menu[coffee] else {
            print("판매하지 않는 커피 종류입니다.")
            return
        }
        if price > 0 {
            pickUpTable?.append(coffee.rawValue)
            sales += price
        }
        if let upwrappedPickUpTable = pickUpTable {
            print("\(name) 님이 주문하신 \(upwrappedPickUpTable)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        }
        
    }
}

// MARK: - 주문 픽업
var missKim: Person = Person(customer: Person.Role.customer, money: 6000)
var yagomBucks: CoffeeShop = .init(
    sales: 0,
    menu: [
        .americano: 3000,
        .cafeLatte: 4000,
        .cafeMocha: 4500,
        .cappuchino: 4500,
        .machiatto: 5000,
        .espresso: 2800
    ],
    pickUpTable: ""
)
// MARK: - 커피 주문
missKim.order(.cappuchino, of: &yagomBucks, by: "missKim")
// MARK: - 카페 매출액 증가 확인
print("yagombucks의 매출액이 \(yagomBucks.sales)원 만큼 증가했습니다.")
// MARK: - 잔액 모자른 case
missKim.order(.americano, of: &yagomBucks, by: "missKim")
