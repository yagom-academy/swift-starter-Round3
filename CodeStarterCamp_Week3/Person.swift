//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 최범수 on 2024-10-07.
//

class Person {
    let name: String
    var money: Int

    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        coffeeShop.make(coffee, by: self, name: name)
    }
}
