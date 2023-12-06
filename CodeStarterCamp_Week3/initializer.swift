//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// MARK: Person 타입 정의
class Person {
    var money: Int = 0
    func buyCoffee(from shop: inout CoffeeShop, types: [CoffeeShop.Coffee]) {
        for type in types {
            shop.takeOrder(customer: self, coffeeType: type)
            
            if let price = shop.menu[type], money >= price {
                money -= price
            }
        }
    }
}
// MARK: 카페 유형
struct CoffeeShop {
    enum Coffee: String {
        case espresso
        case americano
        case cafeLatte
        case cappuchino
        case machiatto
        case cafeMocha
    }
    
    var sales: Int
    var menu: [Coffee: Int]
    var barista: Person?
    
    var pickUpTable: [String] = []
    
    // 커피 주문 메소드
    mutating func takeOrder(customer: Person, coffeeType: Coffee) {
        guard let price = menu[coffeeType] else {
            print("주문이 올바르지 않습니다.")
            return
        }
        if customer.money >= price {
            brewUpCoffee(type: coffeeType)
            sales += Int(price)
        } else {
            print("돈이 부족합니다.")
        }
    }
    // 커피 제조 메소드
    mutating func brewUpCoffee(type: CoffeeShop.Coffee) {
        pickUpTable.append(type.rawValue)
        print("\(type)이(가) 준비되었습니다.")
    }
}
// barista
let misterLee = Person()
// customer
let missKim = Person()

var yagomBucks = CoffeeShop(
    sales: 0,
    menu: [.americano: 4000, .espresso: 3500, .cafeLatte: 4500, .machiatto: 5000, .cappuchino: 5000],
    barista: misterLee,
    pickUpTable: []
)

missKim.money = 10000
missKim.buyCoffee(from: &yagomBucks, types: [.americano, .cappuchino])

print("yagomBucks Order list: \(yagomBucks.pickUpTable)")
print("yagomBucks 매출액: \(yagomBucks.sales)")
print("missKim의 남은 돈: \(missKim.money)")
