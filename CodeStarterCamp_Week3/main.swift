//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

class Person {
    var money: Double = 0.0
    
    func buyCoffee(from coffeeShop: CoffeeShop) {
        coffeeShop.takeOrder(customer: self)
    }
}

class CoffeeShop {
    var revenue: Double = 0.0
    var menu: [(coffeeType: Coffee, price: Double)] = []
    var pickUpTable: [Coffee] = []
    var barista: Person?
    
    func takeOrder(customer: Person) {
        makeCoffee()
        customer.money -= menu[0].price
        revenue += menu[0].price
    }
    
    private func makeCoffee() {
        if let coffeeType = menu.first?.coffeeType {
            pickUpTable.append(coffeeType)
        }
    }
}

enum Coffee {
    case americano
    case latte
    case cappuccino
}

let misterLee = Person()
let missKim = Person()

let yagombucks = CoffeeShop()
yagombucks.barista = misterLee
