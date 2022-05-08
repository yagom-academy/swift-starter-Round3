//
//  File.swift
//  CodeStarterCamp_Week3
//
//  Created by Jiyoung Lee on 2022/05/01.
//

import Foundation

class Person {
    var money: Int
    var name: String
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buyCoffee(at cafe: CoffeeShop, coffee: Coffee) {
        if let coffeePrice = cafe.menuBoard[coffee] {
            if money >= coffeePrice {
                money -= coffeePrice
                cafe.order(coffee, customer: name)
            } else {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
            }
        }
    }
}




