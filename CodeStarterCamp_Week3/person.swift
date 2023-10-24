//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by daekyo on 2023/10/24.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        coffeeShop.takeOrderFor(coffee: coffee)
    }
}
