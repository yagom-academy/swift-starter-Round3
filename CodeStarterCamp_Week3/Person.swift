//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation


struct Person {
    var money: Int
    
    mutating func buyCoffee(shopMenuPrice: CoffeShop, menuName: Coffee) {
        
        if let price = shopMenuPrice.menu[menuName] {
            
            if money < price {
                print("잔액이 부족합니다.")
                return
            }
            self.money -= price
        }

    }
}
