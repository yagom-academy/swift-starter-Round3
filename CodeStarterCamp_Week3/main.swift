//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Person {
    var budget: Int
    
    func buy(something: String) {
        print("\(something)을 삽니다.")
    }
    
    init(budget: Int) {
        self.budget = budget
    }
}

class CoffeeShop {
    var salesRevenue: Int
    var pickUpTable: Array<Menu>?
    var barista: Barista?

    struct Menu {
        var coffeeType: String
        var price: Int
    }
    
    func order(coffee: CoffeeShop.Menu, from: Person) {
        
    }
    func makeCoffee(of: CoffeeShop.Menu) {
        
    }
    
    init(salesRevenue: Int) {
        self.salesRevenue = salesRevenue
    }
}

class Barista: Person {
    var workPlace: CoffeeShop?
    
    override init(budget: Int) {
        super.init(budget: budget)
    }
}

enum CoffeeType: String {
    case Americano
    case Latte
    case Coldbrew
    case Tea
}

var misterLee = Barista(budget: 10000)
var missKim = Person(budget: 10000)
var yagombucks = CoffeeShop(salesRevenue: 0)
yagombucks.barista = misterLee



