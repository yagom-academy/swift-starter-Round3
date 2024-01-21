//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Double
    
    init(money: Double = 0) {
        self.money = money
    }
    
    func buyCoffee(price: Double) {
        if price > money {
            print("커피를 구매할 돈이 부족합니다.")
        } else {
            self.money -= price
            print("\(price)를 지불 하였습니다.")
        }
    }
}

class CoffeeShop {
    var sales: Double = 0.0
    var menus: [String: Double] = ["americano": 3000, "latte": 3500, "hazelnuts": 4000]
    var pickUpTable = [String]()
    var barista: Person?
    
    func takeOrder(coffee: String) {
        if menus.keys.contains(coffee), let price = menus[coffee] {
            self.sales += price
            self.pickUpTable.append(coffee)
        }
    }
    
    func employ(person: Person) {
        self.barista = person
    }
}


var misterLee: Person = Person()
var missKim: Person = Person()

var yagombucks = CoffeeShop()

yagombucks.employ(person: misterLee)

//yagombucks.takeOrder(coffee: .americano)
//yagombucks.takeOrder(coffee: .hazelnuts)
//yagombucks.takeOrder(coffee: .hazelnuts)
//
//print(yagombucks.pickUpTable)



