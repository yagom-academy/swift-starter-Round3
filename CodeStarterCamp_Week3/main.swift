//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


enum Coffee {
    case americano, latte, coldBrew
}

class Person {
    var money: Double = 0.0
    
    func buyCoffee(from coffeeShop: CoffeeShop, type: Coffee) {
        let price = coffeeShop.menu[type] ?? 0.0
        if self.money >= price {
            self.money -= price
            coffeeShop.revenue += price
            coffeeShop.makeCoffee(type: type)
        }
    }
}

class CoffeeShop {
    var revenue: Double = 0.0
    let menu: [Coffee: Double]
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    init(menu: [Coffee: Double]) {
        self.menu = menu
    }
    
    func takeOrder(customer: Person, coffeeType: Coffee) {
        customer.buyCoffee(from: self, type: coffeeType)
    }
    
    func makeCoffee(type: Coffee) {
        pickUpTable.append(type)
    }
}

let misterLee = Person()
misterLee.money = 10.0

let missKim = Person()
missKim.money = 10.0

let yagombucksMenu: [Coffee: Double] = [.americano: 3.0, .latte: 4.0, .coldBrew: 5.0]
let yagombucks = CoffeeShop(menu: yagombucksMenu)
yagombucks.barista = misterLee

yagombucks.takeOrder(customer: misterLee, coffeeType: .americano)
yagombucks.takeOrder(customer: missKim, coffeeType: .coldBrew)
print("매출액: \(yagombucks.revenue)")
