//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Coffee {
    case americano
    case latte
    case cappuccino
}

class Person {
    var money: Double

    init(money: Double) {
        self.money = money
    }

    func purchaseCoffee(from coffeeShop: CoffeeShop, type: Coffee) {
        coffeeShop.takeOrder(from: self, coffeeType: type)
    }
}

class CoffeeShop {
    var sales: Double
    var menu: [Coffee: Double]
    var pickUpTable: [Coffee]

    init(sales: Double, menu: [Coffee: Double]) {
        self.sales = sales
        self.menu = menu
        self.pickUpTable = []
    }

    func takeOrder(from customer: Person, coffeeType: Coffee) {
        if let price = menu[coffeeType], customer.money >= price {
            customer.money -= price
            sales += price
            makeCoffee(type: coffeeType)
        } 
    }

    private func makeCoffee(type: Coffee) {
        pickUpTable.append(type)
    }
}

let misterLee = Person(money: 10.0)
let missKim = Person(money: 15.0)

let yagombucksMenu: [Coffee: Double] = [.americano: 3.0, .latte: 4.0, .cappuccino: 4.5]
let yagombucks = CoffeeShop(sales: 0.0, menu: yagombucksMenu)

yagombucks.takeOrder(from: misterLee, coffeeType: .americano)
yagombucks.takeOrder(from: missKim, coffeeType: .latte)
