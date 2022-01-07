//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by hyogang on 2021/12/28.
//

import Foundation

class Person {
    var name: String
    var money: Int = 0
    
    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
    
    func purchase(price: Int) -> Bool {
        if (money < price) {
            print("잔액이 \(price)원만큼 부족합니다.")
            return false
        }
        money -= price
        return true
    }
}
