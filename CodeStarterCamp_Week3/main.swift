//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    var money = 0
    
    mutating func buyCoffee(_ coffee: Coffee, from coffeeShop: inout CoffeeShop) {
        if coffeeShop.takeOrder(coffee, from: self) {
            self.money = self.money - coffee.rawValue
        }
    }
}

enum Coffee:Int {
    case americano = 4000
    case latte = 4500
    case cappuccino = 5000
    case espresso = 3500
}

struct CoffeeShop {
    var sales = 0
    var barista: Person?
    var menu: [Coffee] = []
    var pickUpTable: [Coffee] = []
    
    mutating func takeOrder(_ coffee: Coffee, from: Person) -> Bool {
        guard menu.contains(coffee) else {
            print("해당 메뉴는 존재하지 않습니다.")
            return false
        }
        if from.money < coffee.rawValue {
            print("잔액이 \(from.money - coffee.rawValue)모자랍니다.")
            return false
        }
        sales = sales + coffee.rawValue
        self.makeCoffee(coffee, from: from.name)
        return true
    }
    
    mutating func makeCoffee(_ coffee: Coffee, from name: String) {
        pickUpTable.append(coffee)
        print("\(name) 님이 주문하신 \(coffee)(이/가) 준비되었습니다. 픽업대에서 가져가주세요.")
    }
    
    init() {
        menu.append(Coffee.americano)
        menu.append(Coffee.latte)
        menu.append(Coffee.cappuccino)
    }
}

var misterLee = Person(name: "misterLee")
var missKim = Person(name: "missKim")

var yagombucks = CoffeeShop()
yagombucks.barista = misterLee
