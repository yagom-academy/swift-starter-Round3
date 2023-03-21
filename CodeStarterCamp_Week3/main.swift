//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var money: Int = 0
    
    func buyCoffee() {
        print("buy coffee.")
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menuTable: [String: Int] = [:]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    func takeOrder(order: Coffee) {
        makeCoffee(coffee: order)
    }
    
    func makeCoffee(coffee: Coffee) {
        pickUpTable.append(coffee)
    }
}

enum Coffee {
    case americano, latte, espresso, iceTea
}

let misterLee: Person = Person()
let missKim: Person = Person()
let yagombucks: CoffeeShop = CoffeeShop()
yagombucks.barista = misterLee
