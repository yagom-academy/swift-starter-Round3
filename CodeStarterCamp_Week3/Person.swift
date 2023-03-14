//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation


class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
        if let price = coffeeShop.menu[coffee] {
            
            if money < price {
                print("잔액이 \(price - money)원만큼 부족합니다")
                return
            } else {
                coffeeShop.takeOrder(coffee, for: name)
                self.money -= price
            }
        }
    }
}
