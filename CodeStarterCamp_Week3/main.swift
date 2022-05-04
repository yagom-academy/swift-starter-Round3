//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

import Foundation

class Person {
    var money: Int?
    
    init(money: Int) {
        self.money = money
    }
    
    init() {}
    
    func buyCoffee() {}
}

class CoffeShop {
    var sales: Int
    var menu: String
    var menuPrice: Int
    var pickupTable: Bool
    var barista: Person
    
    init( salse: Int, menu: String, menuPrice: Int, pickupTable: Bool, barista: Person) {
        self.sales = salse
        self.menu = menu
        self.menuPrice = menuPrice
        self.pickupTable = pickupTable
        self.barista = barista
    }
    
    func order() {}
    func makeCoffee() {}
}

enum coffeMenu {
    case 카페라떼, 아메리카노, 카푸치노, 카페모카, 카라멜마끼야또
    
    var coffeePrice: Int {
        switch self {
        case .카페라떼:
            return 2500
        case .아메리카노:
            return 2000
        case .카푸치노:
            return 2500
        case .카페모카:
            return 3800
        case .카라멜마끼야또:
            return 3500
            
        }
    }
    
}

let misterLee: Person = Person(money: 10000)
let missKim: Person = Person(money: 5000)

let yagombucks: CoffeShop = CoffeShop(salse: 0, menu: " ", menuPrice: 0, pickupTable: true, barista: misterLee)
yagombucks.menu = "\(coffeMenu.카라멜마끼야또)"
yagombucks.menuPrice = coffeMenu.카라멜마끼야또.coffeePrice
print(coffeMenu.카라멜마끼야또.coffeePrice)
