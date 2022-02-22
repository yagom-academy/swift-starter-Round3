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
    var name: String
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
