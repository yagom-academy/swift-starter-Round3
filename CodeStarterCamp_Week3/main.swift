//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    var money: Int
    
    mutating func buyCoffe(with coffee: Coffee, of coffeeShop: CoffeeShop) {
        guard let price = coffeeShop.menu[coffee] else {
            print("메뉴에 없는 커피입니다.")
            return
        }

        guard money >= price else {
            print("잔액이 부족합니다.")
            return
        }
        
        coffeeShop.takeOrder(with: coffee)
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
    
    func takeOrder(with coffee: Coffee) {
        guard let price = self.menu[coffee] else {
            print("없는 메뉴입니다.")
            return
        }
        self.revenue += price
        self.makeCoffee(with: coffee)
    }
    
    func makeCoffee(with coffee: Coffee) {
        self.pickUpTable.append(coffee)
    }
}

enum Coffee {
    case americano
    case latte
    case mocha
}

let misterLee = Person(money: 2_000)
let missKim = Person(money: 2_000)
let yagombucks = CoffeeShop(
    barista: misterLee,
    menu: [
        .americano: 4_500,
        .latte: 5_000
    ]
)
