//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by tom on 2023/03/08.
//

import Foundation

struct Person {
    let name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(coffeeShop: CoffeeShop, coffee: Coffee) {
        print("\(name)은 가지고 있는 \(money)원으로 \(coffeeShop.name)에서 \(coffeeShop.barista.name)가 만들어주는 \(coffee)를 커피를 주문했다")
    }
}
