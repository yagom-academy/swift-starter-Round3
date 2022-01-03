//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 박세웅 on 2021/12/29.
//

import Foundation

struct Person {
    
    // 프로퍼티
    var name: String
    var age: Int
    var gender: String
    var money: Int
    
    // 메서드
    mutating func purchase(shop: CoffeeShop, stuff: Coffee) {
        let price: Int = shop.coffeePrice(coffee: stuff)
        if money >= price {
            money -= price
            shop.customer = Self.init(name: name, age: age, gender: gender, money: money)
            shop.order(coffee: stuff)
        } else {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        }
    }
}
