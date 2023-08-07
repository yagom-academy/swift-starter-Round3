//
//  Step1.swift
//  CodeStarterCamp_Week3
//
//  Created by 홍성준 on 2023/08/02.
//

import Foundation

class Person {
    var name: String
    var asset: Int
    
    init(name: String, asset: Int) {
        self.name = name
        self.asset = asset
    }
    
    func buyCoffee(menu: [Coffee], at coffeeShop: CoffeeShop) {
        coffeeShop.takeOrder(menu: menu)
        for coffee in menu {
            if let price = coffeeShop.menu[coffee] {
                self.asset -= price
            }
        }
    }
}

class CoffeeShop {
    var barista: Person?
    var sales: Int = 0
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    
    init(menu: [Coffee: Int]) {
        self.menu = menu
    }
    
    func takeOrder(menu: [Coffee]) {
        for coffee in menu {
            self.makeCoffee(coffee)
        }
    }
    
    func makeCoffee(_ coffee: Coffee) {
        self.pickUpTable.append(coffee)
        if let sale = menu[coffee] {
            self.sales += sale
        }
    }
}

enum Coffee: String {
    case americano
    case latte
    case iceTea
    
    func price() -> Int {
        switch self {
        case .americano:
            return 4000
        case .latte:
            return 4500
        case .iceTea:
            return 4500
        }
    }
}
