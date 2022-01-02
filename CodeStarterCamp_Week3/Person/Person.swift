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
    mutating func purchase(stuff: String, price: Int) -> Bool {
        if money >= price {
            money -= price
            return true
        } else {
            //print("잔액이 부족하여 \(stuff)를 구매할 수 없습니다.")
            print("잔액이 \(price - money)원만큼 부족합니다.")
            return false
        }
    }
    
}
