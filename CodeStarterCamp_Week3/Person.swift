//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func purchaseCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        coffeeShop.customer = self
        coffeeShop.orderCoffee(coffee: coffee)
    }
}
