//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by ByungHoon Ann on 2022/11/02.
//

import Foundation

class Person {
    var name: String
    var gender: String
    var money: Int
    
    init(name: String, gender: String, money: Int) {
        self.name = name
        self.gender = gender
        self.money = money
    }
    
    /// 잔액과 커피 가격 비교함수
    /// - Parameter price: 구매할 커피 가격
    /// - Returns: money외 price의 크기 비교 Bool
    func canBuyCoffee(price: Int) -> Bool {
        return money > price
    }
    
    /// 구매 결과  출력 함수
    /// - Parameter price: 구마할 커피마격
    func buyCoffee(coffee: Coffee, price: Int) {
        if canBuyCoffee(price: price) {
            money -= price
            print("""
                  \(coffee.rawValue) 구매에 \(price)를 지불하였습니다.
                  잔액: \(money)
                  """)
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
