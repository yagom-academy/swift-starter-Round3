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
    
    /// 커피 주문 함수
    /// - Parameters:
    ///   - coffee: 주문할 커피
    ///   - coffeeShop: 커피숍
    func order(coffee: Coffee, coffeeShop: CoffeeShop) {
        if let coffeePrice = coffeeShop.getCoffeePrice(coffee) {
            if canBuyCoffee(price: coffeePrice) {
                money -= coffeePrice
                coffeeShop.make(coffee, from: name)
            } else {
                print("잔액이 \(coffeePrice - money)원만큼 부족합니다.")
            }
        } else {
            print("해당 커피숍에 \(coffee.rawValue) 메뉴가 없어 구매에 실패하였습니다.")
        }
    }
}
