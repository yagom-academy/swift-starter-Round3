//
//  Person.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

class Person {
    private var name: String
    private var money: Int
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func isSufficeMoney(coffeePrice: Int) -> Bool {
        return coffeePrice <= money
    }
    
    func submitMoney(coffeePrice: Int) {
        money -= coffeePrice
    }
    
    func orderCoffee(coffee: Coffee, coffeeShop: CoffeeShop) {
        let coffeePrice = coffeeShop.coffeeMenu.getPriceOfCoffee(coffee: coffee)
        if !isSufficeMoney(coffeePrice: coffeePrice) {
            print("잔액이 \(coffeePrice - money)만큼 부족합니다.")
            return
        }
        submitMoney(coffeePrice: coffeePrice)        
        coffeeShop.insertOrderToPickUpTable(orderMan: name, coffee: coffee)
        coffeeShop.order(coffee: coffee)
    }
}
