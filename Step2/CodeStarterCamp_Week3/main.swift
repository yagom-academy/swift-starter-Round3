//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case cappuccino = "카푸치노"
    case espresso = "에스프레소"
}

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop) {
        print("\(name) 님이 \(coffee.rawValue)를 주문했습니다.")
        coffeeShop.make(coffee, from: self)
    }
}

class CoffeeShop {
    var menu: [Coffee: Int]
    var sales: Int = 0
    var pickUpTable: [Coffee] = []
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func make(_ coffee: Coffee, from person: Person) {
        if let price = menu[coffee], person.money >= price {
            person.money -= price
            sales += price
            pickUpTable.append(coffee)
            print("\(person.name) 님이 주문하신 \(coffee.rawValue)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
        } else if let price = menu[coffee] {
            let shortage = price - person.money
            print("잔액이 \(shortage)원만큼 부족합니다.")
        }
    }
}

let missKim = Person(name: "missKim", money: 3000)

let yagombucks = CoffeeShop(menu: [.americano: 4000, .latte: 4500, .cappuccino: 5000, .espresso: 3000])

// missKim 주문
missKim.order(.cappuccino, of: yagombucks)  // 잔액이 부족한 경우
missKim.order(.espresso, of: yagombucks)    // 잔액이 충분한 경우
