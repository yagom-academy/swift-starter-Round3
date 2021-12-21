//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 조민호 on 2021/12/20.
//

import Foundation

struct CoffeeShop {
    private(set) var sales: Int
    private(set) var menu: [Coffee:Int]
    private(set) var pickUpTable: [Coffee]
    var barista: Person?
    var customer: Person?
    
    mutating func order(coffee: Coffee) {
        guard let money = customer?.money else {
            return
        }
        
        guard money >= coffee.price else {
            print("잔액이 \(coffee.price - money)원만큼 부족합니다.")
            return
        }
        
        customer?.buy(coffee: coffee)
        self.sales += coffee.price
        brewCoffee(coffee: coffee)
    }
    
    mutating func brewCoffee(coffee: Coffee) {
    
    }
}
