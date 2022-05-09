//
//  person.swift
//  CodeStarterCamp_Week3
//
//  Created by 수염 on 2022/05/05.
//

import Foundation

struct Person {
    var name: String
    var money: Int

    init(name: String, money: Int) {
        self.name = name
        self.money = money
        }
    
    mutating func buyCoffee(coffee: Coffee, cafe: CoffeeShop) {
        print("\(name): \(coffee.menuName) 주세요.")
        if money < coffee.price {
            print("잔액이 \(coffee.price - money)원만큼 부족합니다.")
        } else {
            cafe.order(coffee, self, cafe)
            money -= coffee.price
        }
        print("\(name) 잔액: \(money) 원\n")
    }
}

