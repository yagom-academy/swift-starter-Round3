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
    case frappuccino
}

struct Person {
    let name: String
    var money: Int
    
    mutating func buyProduct(productName: Coffee, quantity: Int, cost: Int) {
        if self.money >= cost * quantity {
            self.money -= cost * quantity
            print("\(self.name) paid \(cost * quantity) for \(quantity) \(productName)(s)")
        } else {
            print("you do not have enough money")
        }
    }
}

struct CoffeeShop {
    var revenue: Int
    var menu: [Coffee: Int]
    var barista = Person(name: "", money: 0)
    var pickUpTable: [String: String]
    
    mutating func takeOrder(person: Person,coffee: Coffee) {
        if let coffeePrice = menu[coffee] {
            revenue += coffeePrice
            makeCoffee(person: person, coffee: coffee)
        } else {
            print("We don't have \(coffee) in our store")
        }
    }
    mutating func makeCoffee(person: Person, coffee: Coffee) {
        print("we made \(coffee) for \(person.name)")
    }
}

var misterLee = Person(name: "misterLee", money: 10000)
var missKim = Person(name: "missKim", money: 20000)

var yagomBucks = CoffeeShop(revenue: 0, menu: [Coffee.americano: 4500, Coffee.latte: 5000, Coffee.frappuccino: 5500], pickUpTable: [:])

yagomBucks.barista = misterLee
