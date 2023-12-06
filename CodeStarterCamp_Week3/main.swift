//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Combine
import Foundation

struct Person {
    var name: String
    var money: Int
    
    mutating func buyCoffee(with coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("메뉴에 없는 커피입니다.")
            return
        }
        
        guard money >= price else {
            print("잔액이 \(price - money)원만큼 부족합니다.")
            return
        }
        
        coffeeShop.takeOrder(with: coffee, from: self.name)
        self.money -= price
    }
}

class CoffeeShop {
    let barista: Person
    var revenue: Int = 0
    let menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    
    init(barista: Person, menu: [Coffee: Int]) {
        self.barista = barista
        self.menu = menu
    }
    
    func takeOrder(with coffee: Coffee, from name: String) {
        guard let price = self.menu[coffee] else {
            print("없는 메뉴입니다.")
            return
        }
        self.revenue += price
        self.makeCoffee(with: coffee, from: name)
    }
    
    func makeCoffee(with coffee: Coffee, from name: String) {
        self.pickUpTable.append(coffee)
        
        print("\(name) 님이 주문하신 \(coffee.name)(이/가) 준비되었습니다. 픽업대에 가져가주세요.")
    }
}

enum Coffee: String {
    case americano = "아메리카노"
    case latte = "라떼"
    case mocha = "모카"
    case cappuccino = "카푸치노"
    
    var name: String {
        self.rawValue
    }
}

let misterLee = Person(name: "misterLee", money: 2_000)
var missKim = Person(name: "missKim", money: 10_000)
let yagombucks = CoffeeShop(
    barista: misterLee,
    menu: [
        .americano: 4_500,
        .latte: 5_000,
        .cappuccino: 5_500
    ]
)

missKim.buyCoffe(with: .cappuccino, of: yagombucks)
