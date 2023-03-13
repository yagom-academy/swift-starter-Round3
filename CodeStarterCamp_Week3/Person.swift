//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation


struct Person {
    var money: Int
    
    mutating func orderCoffee(from shop: CoffeShop, for menu: Coffee) {
        
        if let price = shop.menu[menu] {
            
            if money < price {
                print("잔액이 부족합니다.")
                return
            }
            self.money -= price
        }

    }
}
