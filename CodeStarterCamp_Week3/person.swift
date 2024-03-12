//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by CHYUN on 3/1/24.
//

import Foundation

class Person {
    let name: String
    var money: Int
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(_ coffee: Coffee, of coffeeshop: CoffeeShop, by name: String) {
        if let price = coffeeshop.menu[coffee] {
            if price <= money {
                money -= price
                coffeeshop.make(coffee, from: name)
            } else {
                print("잔액이 \(price - money)원만큼 부족합니다.")
            }
        }
    }

}
