//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int
    
    init(name: String, age: Int, money: Int) {
        self.name = name
        self.age = age
        self.money = money
    }
    func buyStuffe() {
        print("물건을 구매하는 메서드")
    }
}

struct CoffeeShop {
    var totalRevenue: Int
    var menu: [Coffee: Int]
    var pickUpTable: String
    var barista: Person
    
    func order() {
            print("주문받는 메서드")
        }
}

enum Coffee {
    case americano
    case latte
    case cappuccino
}

var misterLee = Person(name: "misterLee", age: 25, money: 10000)
var missKim = Person(name: "missKim", age: 27, money: 20000)
var yagomBucks = CoffeeShop(totalRevenue: 0, menu: [Coffee.americano: 5000, Coffee.latte: 5500, Coffee.cappuccino: 5500], pickUpTable: "주문하신 \(Coffee.Type.self) 나왔습니다.", barista: misterLee)
