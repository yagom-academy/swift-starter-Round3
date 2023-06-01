//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김예림 on 2023/06/01.
//

import Foundation

struct Person {
    var name: String
    var money: Int
    
    // 커피메뉴 고르기
    func chooseCoffee(menu coffee: Coffee) -> Coffee {
        return coffee
    }
    
    // 커피 구매하기
    mutating func tryBuyCoffee(coffee: Coffee) -> String {
        
        guard money >= coffee.price else {
            print("\(name) 님은 돈이 부족하여 커피 구매에 실패하였습니다.")
            return "Failure"
        }

        money -= coffee.price
        print("\(name) 님이 \(coffee.coffeeType) 메뉴를 구매했습니다.")
        return "Success"
    }
}
