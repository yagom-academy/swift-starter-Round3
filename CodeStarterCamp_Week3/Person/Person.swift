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
    mutating func purchase(stuff: String, price: Int) {
        if money > price {
            self.money -= price
            print("\(stuff)를 구매하고 \(price)원을 지불했습니다. 현재 가지고 있는 재산은 \(self.money)원 입니다.")
        } else {
            print("잔액이 부족하여 \(stuff)를 구매할 수 없습니다.")
        }
    }
    
}
