//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by Lee minyeol on 2023/06/12.
//

import Foundation

class Person {
    var name: String
    var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func order(coffee: Coffee, coffeeshop: CoffeeShop) {
        if let coffePrice = coffeeshop.menuboard[coffee] {
            if money <= coffePrice {
                print("잔액이 \(coffePrice - money)원만큼 부족합니다.")
                return
            }
            money -= coffePrice
            print("결제 완료됐습니다.")
        }
    }
}

