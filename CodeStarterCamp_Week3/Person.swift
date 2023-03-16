//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 김형철 on 2023/03/09.
//

import Foundation


class Person {
    var money: Int
    var name: String
    
    init(money: Int, name: String) {
        self.money = money
        self.name = name
    }
    
    
    func hasExistingCoffee(_ coffee: Coffee, coffeeShop: CoffeeShop) -> Bool {
        guard let _ = coffeeShop.menu[coffee] else { return false }
        
        return true
    }
    
    
    func canAffordCoffee(_ coffee: Coffee, coffeeShop: CoffeeShop) -> Bool {
        if let price = coffeeShop.menu[coffee] {
            if price > money {
                print("잔액이 \(price - money)원만큼 부족합니다.")
                return false
            }
        }
        
        return true
    }
    
    
    func deductCostOfCoffee(_ coffee: Coffee, coffeeShop: CoffeeShop) {
        if let price = coffeeShop.menu[coffee] {
            self.money -= price
        }
    }
    
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop, by name: String) {
        
        guard hasExistingCoffee(coffee, coffeeShop: coffeeShop) else {
            print("판매하지 않는 커피입니다. 확인하시고 다시 주문해주세요.")
            return
        }
        
        guard canAffordCoffee(coffee, coffeeShop: coffeeShop) else { return }
        
        coffeeShop.takeOrder(coffee, for: name)
        deductCostOfCoffee(coffee, coffeeShop: coffeeShop)
    }
}
