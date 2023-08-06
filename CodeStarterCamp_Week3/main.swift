//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//step1

enum Coffee {
    case americano
    case latte
    case cappuccino
}

class Person {
    var money: Int = 0
    
    func order(_ coffee: Coffee, coffeeShop: CoffeeShop) {
        coffeeShop.make(coffee, barista: misterLee)
    }
}

class CoffeeShop {
    var sales: Int = 0
    var menu: [Coffee : Int] = [.americano : 3000, .latte : 4000, .cappuccino : 5000]
    var pickUpTable: [Coffee] = []
    var barista: Person
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func make(_ coffee: Coffee, barista: Person) {
        pickUpTable.append(coffee)
    }
}

var misterLee: Person = Person()
var missKim: Person = Person()
var yagombuck: CoffeeShop = CoffeeShop(barista: misterLee)
