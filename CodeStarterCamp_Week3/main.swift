//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee: CaseIterable {
    case americano
    case latte
    case espresso
    
    var price: Int {
        switch self {
        case .espresso:
            return 3800
        case .americano:
            return 4100
        case .latte:
            return 4500
        }
    }
}

struct Person {
    let name: String
    var money: Int
    
    mutating func buySomething(for price: Int) {
        let hasEnoughMoney = self.money >= price
        if hasEnoughMoney {
            self.money -= price
            print("\(self.name)이 구매를 완료했습니다. 잔액은 \(self.money)원 입니다")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
var misterLee = Person(name: "misterLee", money: 100000)
var missKim = Person(name: "missKim", money: 100000)

struct CoffeShop {
    var sales: Int
    let menu: [Coffee: Int]
    var pickUpTable: String
    var barista: Person?

    mutating func takeOrder(coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            sales += coffeePrice
        } else {
            print("다시 주문해주세요")
        }
    }
    
    func makeCoffee(coffee: Coffee, to person: Person) {
        let isCompleted = pickUpTable == "on"
        if isCompleted {
            print("\(person.name)님 주문하신 \(coffee) 나왔습니다")
        } else {
            print("잠시만 기다려주세요")
        }
    }
}

var yagombucks = CoffeShop(sales: 200000, menu: [Coffee.espresso: 3800, Coffee.americano: 4100, Coffee.latte: 4500], pickUpTable: "on", barista: misterLee)
