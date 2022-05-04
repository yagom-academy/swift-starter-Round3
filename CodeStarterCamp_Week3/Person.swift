//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Seong A Oh on 2022/05/05.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, shop: CoffeeShop) {
        guard let price = shop.menu[coffee] else {
            return
        }
        
        if self.money > price {
            shop.order(coffee: coffee)
            self.money -= price
        } else {
            let lack = price - self.money
            print("잔액이 \(lack)원만큼 부족합니다.")
        }
    }
}
