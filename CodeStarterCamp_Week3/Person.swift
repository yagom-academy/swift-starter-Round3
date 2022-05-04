//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Seong A Oh on 2022/05/05.
//

import Foundation

class Person {
    var name: String
    var money: Int {
        willSet(newValue) {
            if self.money > 0 {
                let willUse = self.money - newValue
                print("\(willUse)원이 차감됩니다")
            }
        }
        
        didSet {
            print("잔액이 \(self.money)원 남았습니다.")
        }
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(coffee: Coffee, shop: CoffeeShop) {
        guard let price = shop.menu[coffee] else {
            return
        }
        
        if self.money >= price {
            shop.order(coffee: coffee, name: self.name)
            self.money -= price
        } else {
            let lack = price - self.money
            print("잔액이 \(lack)원만큼 부족합니다.")
        }
    }
}
