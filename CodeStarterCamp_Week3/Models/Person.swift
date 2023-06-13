//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

import Foundation

final class Person {
    
    private(set) var money: Int = 0
    private(set) var name: String
    
    func orderCoffee(in coffeeShop: CoffeeShop, to coffee: Coffee) {
        
        let (isSale, price) = coffeeShop.checkOnSale(to: coffee)
        guard isSale else {
            print("판매하지 않는 종류입니다.")
            return
        }
        
        guard price <= money else {
            print("잔액이 \(price - money)원만큼  부족합니다")
            return
        }
        
        money -= price
        
        coffeeShop.takeOrder(coffee, of: coffeeShop, by: name) {
            print("픽업대에서 음료를 가져왔습니다.")
        }
        
    }
    
    init(name: String, money: Int = 0) {
        self.name = name
        self.money = money
    }
}
