//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 심정민 on 2023/06/14.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    func orderCoffee(_ Coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        if let money = coffeeShop.menuList[Coffee] {
            if self.money > money {
                self.money -= money
                coffeeShop.makeCoffee(Coffee, for: self.name)
            } else {
                self.money -= money
                print("잔액이 \(abs(self.money))만큼 부족합니다.")
            }
        }
    }
}
