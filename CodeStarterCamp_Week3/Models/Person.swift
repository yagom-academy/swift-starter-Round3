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
        if coffee.price > money {
            print("잔액이 부족합니다.")
            return
        }
        
        coffeeShop.takeOrder(to: coffee)
        money -= coffee.price
    }
    
    init(money: Int) {
        self.money = money
    }
    
    init() { }
}
