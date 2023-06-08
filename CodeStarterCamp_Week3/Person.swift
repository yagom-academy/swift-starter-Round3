//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김예림 on 2023/06/01.
//

import Foundation

struct Person {
    private(set) var name: String
    private(set) var money: Int
    private var balance: Int = 0
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    /// 커피메뉴 고르기
    func chooseCoffee(menu coffee: Coffee) -> Coffee {
        return coffee
    }
    
    /// 커피 구매하기
    mutating func canBuyCoffee(coffee: Coffee) -> Bool {
        
        guard money >= coffee.price else {
            balance = coffee.price - money
            print("잔액이 \(balance)원만큼 부족합니다.")
            return false
        }

        money -= coffee.price
        print("\(name) 님이 \(coffee.description) 메뉴를 구매했습니다.")
        return true
    }
    
    
    /// 커피 주문하기 함수
    mutating func order(_ coffee: Coffee, of coffeeShop: inout CoffeeShop) {
        coffeeShop.orderCoffee(from: &self, menu: coffee, barista: "missLee")
    }
}
