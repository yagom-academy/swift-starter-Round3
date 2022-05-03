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
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(ordered: Coffee, shop: CoffeeShop) {
    }
}

class CoffeeShop {
    var revenue: Int
    var menu: [Coffee : Int]
    var barista: [Person] = []
    var pickUpTable: Bool?
    
    init(revenue: Int, menu: [Coffee: Int]) {
        self.revenue = revenue
        self.menu = menu
    }
    
    func orderedCoffee(coffee: Coffee) {
    }
}

enum Coffee {
    case espresso
    case americano
    case vanillaLatte
    case cafeMocha
}

