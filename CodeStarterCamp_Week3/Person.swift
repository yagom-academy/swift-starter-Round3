//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by suyeon park on 2023/03/09.
//

import Foundation

class Person {
    var totalMoney: Int
    
    func order(_ coffee: Coffee, of coffeeShop: CoffeeShop2, by name: String) {
        if calculateMoney(spendMoney: coffeeShop.getTotalPrice(coffees: coffee)) {
            coffeeShop.make(coffee, for: name)
        }
    }
    
    func calculateMoney(spendMoney: Int) -> Bool {
        if totalMoney >= spendMoney {
            totalMoney = totalMoney - spendMoney
            return true
        } else {
            print("잔액이 \(spendMoney-totalMoney)만큼 부족합니다.")
            return false
        }
    }
    
    init (totalMoney: Int) {
        self.totalMoney = totalMoney
    }
}
