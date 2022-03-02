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

class Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, from coffeeShop: CoffeeShop) {
        let hasEnoughMoney = self.money >= coffee.price
        guard hasEnoughMoney else {
            self.money -= coffee.price
            print("잔액이 \(-self.money)원만큼 부족합니다.")
            return
        }
        self.money -= coffee.price
        print("결제가 완료되었습니다. 잔액은 \(self.money)원입니다.")
        coffeeShop.takeOrder(coffee: coffee, from: self)
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 10000)

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
