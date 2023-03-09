//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



struct Person {
    var money: Int
    
    mutating func buyCoffee(coffeePrice: CoffeShop, coffee: Coffee) {
        
        if let price = coffeePrice.menu[coffee] {
            self.money -= price
        }

    }
}


struct CoffeShop {
    var barista: Person!
    var sales: Int
    var menu: Dictionary<Coffee, Int>
    var pickUpTable: [Coffee]
    
    mutating func takeOrder(for coffee: Coffee) -> Coffee {
        if coffee == Coffee.latte {
            self.pickUpTable.append(coffee)
        } else if coffee == .americano {
            self.pickUpTable.append(coffee)
        } else {
            self.pickUpTable.append(coffee)
        }
        
        return pickUpTable[pickUpTable.endIndex - 1]
    }
    
    
}

enum Coffee {
    case latte
    case americano
    case lemonade
}

var misterLee: Person = Person(money: 1000)
var missKim: Person = Person(money: 2000)

var yagombucks: CoffeShop = CoffeShop(sales: 0, menu: [:], pickUpTable: [])
yagombucks.barista = misterLee


