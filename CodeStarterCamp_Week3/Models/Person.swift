//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 이지원 on 2023/06/03.
//

import Foundation

final class Person {
    
    private(set) var money: Int = 0
    
    func orderCoffee(in coffeeShop: CoffeeShop, to coffee: Coffee) {
        
        guard coffee.price <= money else {
            print("잔액이 부족합니다.")
            return
        }
        
        coffeeShop.takeOrder(to: coffee) {
            print("픽업대에서 음료를 가져가주세요")
        }
        money -= coffee.price
    }
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        guard coffee.price <= money else {
            print("잔액이 \(coffee.price - money)원만큼 부족합니다.")
            return
        }
        
        coffeeShop.order(coffee, of: coffeeShop, by: name)
    }
    
    
    init(money: Int = 0) {
        self.money = money
    }
}
