//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 맨태 on 1/9/24.
//

import Foundation

final class Person {
    private(set) var name: String
    private var weight: Int
    private var height: Int
    private(set) var nationality: String
    private(set) var mbti: String
    private var money: Int
    
    init(name: String, weight: Int, height: Int, nationality: String, mbti: String, money: Int) {
        self.name = name
        self.weight = weight
        self.height = height
        self.nationality = nationality
        self.mbti = mbti
        self.money = money
    }

    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard let price = coffeeShop.menus[coffee] else {
            print("주문을 다시 한번 확인해주세요.")
            return
        }
        
        if price > money {
            print("잔액이 \(price - money)원만큼 부족합니다.")
        } else {
            coffeeShop.make(coffee, from: name)
        }
    }
}
